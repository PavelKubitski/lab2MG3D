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

- (void)compileVertexShader:(NSString *)vertexShader fragmentShader:(NSString *)fragmentShader fragmentShaderBlack:(NSString *)fragmentShaderBlack {
    self->vertexShaderName = [self compileShader:vertexShader
                                         withType:GL_VERTEX_SHADER];
    self->fragmentShaderName = [self compileShader:fragmentShader
                                           withType:GL_FRAGMENT_SHADER];
    self->fragmentShaderBlackName = [self compileShader:fragmentShaderBlack
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

- (void)prepareToDraw:(BOOL)shadow {
    glUseProgram(_programHandle);
    
    if (shadow) {
        glDetachShader(_programHandle, self->fragmentShaderName);
        glAttachShader(_programHandle, self->fragmentShaderBlackName);
    } else {
        glDetachShader(_programHandle, self->fragmentShaderBlackName);
        glAttachShader(_programHandle, self->fragmentShaderName);
    }
    glLinkProgram(_programHandle);
    glUniformMatrix4fv(_projectionUniform, 1, 0, self.projectionMatrix.m);
    glUniformMatrix4fv(_modelViewMatrixUniform, 1, 0, self.modelViewMatrix.m);
    
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, self.texture);
    glUniform1i(_texUniform, 1);
    
    glUniform3f(_lightColorUniform, 1, 1, 1);
    glUniform1f(_lightAmbientIntensityUniform, 0.4);
    GLKVector4 lightDirection = GLKVector4Normalize(GLKVector4Make(0.5, -1, -1, 0)); //GLKVector3Normalize(GLKVector3Make(0, -1, -1));
    glUniform3f(_lightDirectionUniform, lightDirection.x, lightDirection.y, lightDirection.z);
    glUniform1f(_lightDiffuseIntensityUniform, 1);
    glUniform1f(_matSpecularIntensityUniform, 2.0);
    glUniform1f(_shininessUniform, 8.0);
    
    
}

- (instancetype)initWithVertexShader:(NSString *)vertexShader fragmentShader:(NSString *)fragmentShader fragmentShaderBlack:(NSString *)fragmentShaderBlack {
    if ((self = [super init])) {
        [self compileVertexShader:vertexShader fragmentShader:fragmentShader fragmentShaderBlack:fragmentShaderBlack];
    }
    return self;
}
@end
