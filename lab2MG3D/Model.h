//
//  Model.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"
#import "BaseEffect.h"

@import GLKit;

@interface Model : NSObject


@property (nonatomic, strong) BaseEffect *shader;

@property (nonatomic, assign) GLKVector3 position;
@property (nonatomic, assign) float rotationX;
@property (nonatomic, assign) float rotationY;
@property (nonatomic, assign) float rotationZ;
@property (nonatomic, assign) float scaleX;
@property (nonatomic, assign) float scaleY;
@property (nonatomic, assign) float scaleZ;
@property (nonatomic, assign) GLKVector3 velocity;
@property (nonatomic) GLuint texture;

@property (nonatomic, strong) NSMutableArray *children;

- (instancetype)initWithName:(char *)name shader:(BaseEffect *)shader vertices:(MyVertex *)vertices vertexCount:(unsigned int)vertexCount;
- (void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix;
- (void)updateWithDelta:(GLfloat)aDelta;
- (void)loadTexture:(NSString *)filename;
@end
