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
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vao);
    glDrawArrays(GL_TRIANGLES,0, _vertexCount);
    glBindVertexArrayOES(0);
    
    

    GLKMatrix4 mvpMatrix = GLKMatrix4Multiply(modelViewMatrix, _shader.matrix);
    _shader.modelViewMatrix = mvpMatrix;
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vao);
    glDrawArrays(GL_TRIANGLES,0, _vertexCount);
    glBindVertexArrayOES(0);
    
}







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
