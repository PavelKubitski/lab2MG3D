//
//  BaseEffect.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "BaseEffect.h"
#import "Vertex.h"
#import "OpenGLES/ES2/glext.h"

typedef GLfloat GLTVector4[4];
typedef GLfloat GLTVector3[3];
typedef GLfloat GLTMatrix[16];

GLfloat gltGetVectorLength(GLTVector3 vNormal)
{
    return sqrt(vNormal[0] * vNormal[0] + vNormal[1] * vNormal[1] + vNormal[2] * vNormal[2]);
}

void gltScaleVector(GLTVector3 vVector, const GLfloat fScale)
{
    vVector[0] *= fScale; vVector[1] *= fScale; vVector[2] *= fScale;
}

void gltNormalizeVector(GLTVector4 vNormal)
{
    GLfloat fLength = 1.0f / gltGetVectorLength(vNormal);
    gltScaleVector(vNormal, fLength);
}

void gltSubtractVectors(const GLTVector3 vFirst, const GLTVector3 vSecond, GLTVector3 vResult)
{
    vResult[0] = vFirst[0] - vSecond[0];
    vResult[1] = vFirst[1] - vSecond[1];
    vResult[2] = vFirst[2] - vSecond[2];
}

void gltVectorCrossProduct(const GLTVector3 vU, const GLTVector3 vV, GLTVector4 vResult)
{
    vResult[0] = vU[1]*vV[2] - vV[1]*vU[2];
    vResult[1] = -vU[0]*vV[2] + vV[0]*vU[2];
    vResult[2] = vU[0]*vV[1] - vV[0]*vU[1];
}

void gltGetNormalVector(const GLTVector3 vP1, const GLTVector3 vP2, const GLTVector3 vP3, GLTVector4 vNormal)
{
    GLTVector3 vV1, vV2;
    
    gltSubtractVectors(vP2, vP1, vV1);
    gltSubtractVectors(vP3, vP1, vV2);
    
    gltVectorCrossProduct(vV1, vV2, vNormal);
    gltNormalizeVector(vNormal);
}

void gltGetPlaneEquation(GLTVector3 vPoint1, GLTVector3 vPoint2, GLTVector3 vPoint3, GLTVector4 vPlane)
{
    gltGetNormalVector(vPoint1, vPoint2, vPoint3, vPlane);
    vPlane[3] = -(vPlane[0] * vPoint3[0] + vPlane[1] * vPoint3[1] + vPlane[2] * vPoint3[2]);
}

//void ShadowMatrix(GLTVector3 vPoints1, GLTVector3 vPoints2, GLTVector3 vPoints3, GLTVector4 vLightPos)
GLKMatrix4 ShadowMatrix()
{
    GLTVector3 points[3] = {{-1, 0, -1},
                            {-1, 0, 1},
                            {1,  0, 1}};
    
    GLTMatrix destMat;
    
    GLTVector4 vLightPos;
    vLightPos[0] = 0;
    vLightPos[1] = 1;
    vLightPos[2] = 1;
    vLightPos[3] = 0;
    
    GLTVector4 vPlaneEquation;
    GLfloat dot;
    
    gltGetPlaneEquation(points[0], points[1], points[2], vPlaneEquation);
    
    dot =    vPlaneEquation[0]*vLightPos[0] +
			 vPlaneEquation[1]*vLightPos[1] +
			 vPlaneEquation[2]*vLightPos[2] +
			 vPlaneEquation[3]*vLightPos[3];
    
    destMat[0]  = dot  - vLightPos[0] * vPlaneEquation[0];
    destMat[4]  = 0.0f - vLightPos[0] * vPlaneEquation[1];
    destMat[8]  = 0.0f - vLightPos[0] * vPlaneEquation[2];
    destMat[12] = 0.0f - vLightPos[0] * vPlaneEquation[3];
    
    destMat[1]  = 0.0f - vLightPos[1] * vPlaneEquation[0];
    destMat[5]  = dot  - vLightPos[1] * vPlaneEquation[1];
    destMat[9]  = 0.0f - vLightPos[1] * vPlaneEquation[2];
    destMat[13] = 0.0f - vLightPos[1] * vPlaneEquation[3];
    
    destMat[2]  = 0.0f - vLightPos[2] * vPlaneEquation[0];
    destMat[6]  = 0.0f - vLightPos[2] * vPlaneEquation[1];
    destMat[10] = dot  - vLightPos[2] * vPlaneEquation[2];
    destMat[14] = 0.0f - vLightPos[2] * vPlaneEquation[3];
    
    destMat[3]  = 0.0f - vLightPos[3] * vPlaneEquation[0];
    destMat[7]  = 0.0f - vLightPos[3] * vPlaneEquation[1];
    destMat[11] = 0.0f - vLightPos[3] * vPlaneEquation[2];
    destMat[15] = dot  - vLightPos[3] * vPlaneEquation[3];
    
    //    return destMat;
    GLKMatrix4 mat;
    for (int i = 0; i < 16; i++) {
        mat.m[i] = destMat[i];
    }
    
    return mat;
    
}


@implementation BaseEffect {
    GLuint _programHandle;
    GLuint _projectionUniform;
    GLuint _modelViewMatrixUniform;
    GLuint _texUniform;
    GLuint _lightColorUniform;
    GLuint _lightAmbientIntensityUniform;
    GLuint _lightDiffuseIntensityUniform;
    GLuint _lightDirectionUniform;
    GLuint _matSpecularIntensityUniform;
    GLuint _shininessUniform;
}

- (GLuint)compileShader:(NSString*)shaderName withType:(GLenum)shaderType {
    NSString* shaderPath = [[NSBundle mainBundle] pathForResource:shaderName ofType:nil];
    NSError* error;
    NSString* shaderString = [NSString stringWithContentsOfFile:shaderPath encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString) {
        NSLog(@"Error loading shader: %@", error.localizedDescription);
        exit(1);
    }
    
    GLuint shaderHandle = glCreateShader(shaderType);
    
    
    
    const char * shaderStringUTF8 = [shaderString UTF8String];
    int shaderStringLength = (int)[shaderString length];
    glShaderSource(shaderHandle, 1, &shaderStringUTF8, &shaderStringLength);
    
    glCompileShader(shaderHandle);
    
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    return shaderHandle;
}

- (void)compileVertexShader:(NSString *)vertexShader fragmentShader:(NSString *)fragmentShader {
    GLuint vertexShaderName = [self compileShader:vertexShader
                                         withType:GL_VERTEX_SHADER];
    GLuint fragmentShaderName = [self compileShader:fragmentShader
                                           withType:GL_FRAGMENT_SHADER];
    
    _programHandle = glCreateProgram();
    glAttachShader(_programHandle, vertexShaderName);
    glAttachShader(_programHandle, fragmentShaderName);
    
    glBindAttribLocation(_programHandle, VertexAttribPosition, "a_Position");
    glBindAttribLocation(_programHandle, VertexAttribColor, "a_Color");
    glBindAttribLocation(_programHandle, VertexAttribTexCoord, "a_TexCoord");
    
    glLinkProgram(_programHandle);
    
    self.modelViewMatrix = GLKMatrix4Identity;
    
    _projectionUniform = glGetUniformLocation(_programHandle, "u_ProjectionMatrix");
    _modelViewMatrixUniform = glGetUniformLocation(_programHandle, "u_ModelViewMatrix");
    _texUniform = glGetUniformLocation(_programHandle, "u_Texture");
    _lightColorUniform = glGetUniformLocation(_programHandle, "u_Light.Color");
    _lightAmbientIntensityUniform = glGetUniformLocation(_programHandle, "u_Light.AmbientIntensity");
    _lightDiffuseIntensityUniform = glGetUniformLocation(_programHandle, "u_Light.DiffuseIntensity");
    _lightDirectionUniform = glGetUniformLocation(_programHandle, "u_Light.Direction");
    _matSpecularIntensityUniform = glGetUniformLocation(_programHandle, "u_MatSpecularIntensity");
    _shininessUniform = glGetUniformLocation(_programHandle, "u_Shininess");
    
    self.matrix = ShadowMatrix();
    
    GLint linkSuccess;
    glGetProgramiv(_programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetProgramInfoLog(_programHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
}

- (void)prepareToDraw {
    glUseProgram(_programHandle);
    glUniformMatrix4fv(_projectionUniform, 1, 0, self.projectionMatrix.m);
    glUniformMatrix4fv(_modelViewMatrixUniform, 1, 0, self.modelViewMatrix.m);
    
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, self.texture);
    glUniform1i(_texUniform, 1);
    
    glUniform3f(_lightColorUniform, 1, 1, 1);
    glUniform1f(_lightAmbientIntensityUniform, 0.4);
    GLKVector4 lightDirection = GLKVector4Normalize(GLKVector4Make(0, -1, -1, 0)); //GLKVector3Normalize(GLKVector3Make(0, -1, -1));
    glUniform3f(_lightDirectionUniform, lightDirection.x, lightDirection.y, lightDirection.z);
    glUniform1f(_lightDiffuseIntensityUniform, 1);
    glUniform1f(_matSpecularIntensityUniform, 2.0);
    glUniform1f(_shininessUniform, 8.0);
    
    
}

- (instancetype)initWithVertexShader:(NSString *)vertexShader fragmentShader:(NSString *)fragmentShader {
    if ((self = [super init])) {
        [self compileVertexShader:vertexShader fragmentShader:fragmentShader];
    }
    return self;
}
@end
