//
//  Model.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Model.h"
#import "BaseEffect.h"
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
GLKMatrix4 ShadowMatrix(GLfloat y)
{
//    GLTVector3 points[3] = {{-1, 0, z},
//                            {-1, -1, z},
//                            {1,  0, z}};

    GLTVector3 points[3] = {{-1, y, -1},
        {-1, y, 1},
        {1,  y, 1}};
    
    GLTMatrix destMat;
    
    GLTVector4 vLightPos;
    vLightPos[0] = -0.5;
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
    
    GLKMatrix4 mat;
    for (int i = 0; i < 16; i++) {
        mat.m[i] = destMat[i];
    }
    
    return mat;
    
}

@interface Model ()

@property (nonatomic, assign) char *name;
@property (nonatomic, assign) GLuint vao;
@property (nonatomic, assign) GLuint vertexBuffer;
@property (nonatomic, assign) GLuint indexBuffer;
@property (nonatomic, assign) unsigned int vertexCount;
@property (nonatomic, assign) unsigned int indexCount;


@end


@implementation Model
@synthesize position = _position;
@synthesize scaleX = _scaleX;
@synthesize scaleY = _scaleY;
@synthesize scaleZ = _scaleZ;
- (instancetype)initWithName:(char *)name shader:(BaseEffect *)shader vertices:(MyVertex *)vertices vertexCount:(unsigned int)vertexCount {
    if ((self = [super init])) {
        self.shadowMatrix = ShadowMatrix(0);
        self.name = name;
        self.vertexCount = vertexCount;
        self.shader = shader;
        self.position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scaleX = 1.0;
        self.scaleY = 1.0;
        self.scaleZ = 1.0;
        
        self.children = [[NSMutableArray alloc] init];
        
        
        
        glGenVertexArraysOES(1, &_vao);
        glBindVertexArrayOES(_vao);
        
        // Generate vertex buffer
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(MyVertex), vertices, GL_STATIC_DRAW);
        

        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(MyVertex), (const GLvoid *) offsetof(MyVertex, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(MyVertex), (const GLvoid *) offsetof(MyVertex, Color));
        glEnableVertexAttribArray(VertexAttribTexCoord);
        glVertexAttribPointer(VertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, sizeof(MyVertex), (const GLvoid *) offsetof(MyVertex, TexCoord));
        glEnableVertexAttribArray(VertexAttribNormal);
        glVertexAttribPointer(VertexAttribNormal, 3, GL_FLOAT, GL_FALSE, sizeof(MyVertex), (const GLvoid *) offsetof(MyVertex, Normal));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
        
        
    }
    return self;
}

- (void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix {
    
    

    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(parentModelViewMatrix, [self modelMatrix]);
    for (Model *child in self.children) {
        [child renderWithParentModelViewMatrix:modelViewMatrix];
    }
    _shader.modelViewMatrix = modelViewMatrix;
    _shader.texture = self.texture;
    [_shader prepareToDraw:NO];
    
    glBindVertexArrayOES(_vao);
    glDrawArrays(GL_TRIANGLES,0, _vertexCount);
    glBindVertexArrayOES(0);
    


    GLKMatrix4 mvpMatrix = GLKMatrix4Multiply(modelViewMatrix, self.shadowMatrix);
    _shader.modelViewMatrix = mvpMatrix;
    [_shader prepareToDraw:YES];
    
    glBindVertexArrayOES(_vao);
    glDrawArrays(GL_TRIANGLES,0, _vertexCount);
    glBindVertexArrayOES(0);

}

- (GLKMatrix4)getShadowMatrix:(GLfloat)y {
    GLKMatrix4 matrix = ShadowMatrix(y);
    return matrix;
}


//- (void)setRotationX:(float)rotationX {
//    _rotationX = rotationX;
//    
//}

//- (void)setPosition:(GLKVector3)position {
//    _position = position;
//    self.shadowMatrix = ShadowMatrix(-_position.z);
//    NSLog(@"setPosition\n");
//}




- (GLKMatrix4)modelMatrix {
    
    GLKMatrix4 modelMatrix = GLKMatrix4Identity;
    modelMatrix = GLKMatrix4Translate(modelMatrix, self.position.x, self.position.y, self.position.z);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationX, 1, 0, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationY, 0, 1, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationZ, 0, 0, 1);
    modelMatrix = GLKMatrix4Scale(modelMatrix, self.scaleX, self.scaleY, self.scaleZ);
    return modelMatrix;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    self.position = GLKVector3Add(self.position, GLKVector3MultiplyScalar(self.velocity, aDelta));
}

- (void)loadTexture:(NSString *)filename {
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    
    NSDictionary *options = @{ GLKTextureLoaderOriginBottomLeft: @YES };
    GLKTextureInfo *info = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
    if (info == nil) {
        NSLog(@"Error loading file: %@", error.localizedDescription);
    } else {
        self.texture = info.name;
    }
}



@end
