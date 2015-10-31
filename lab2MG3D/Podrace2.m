//
//  Podrace2.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Podrace2.h"


@implementation Podrace2

@synthesize position = _position;
- (instancetype)initWithShader:(BaseEffect*)shader
{
    self = [super init];
    if (self) {
        self.pod = [[Pod2 alloc] initWithShader:shader];
        self.pod.rotationX = GLKMathDegreesToRadians(90);
        self.pod.rotationY = -GLKMathDegreesToRadians(90);
        self.pod.shadowMatrix = [self.pod getShadowMatrix:-1];
        self.leftEngine = [[Engine2left alloc] initWithShader:shader];
        self.leftEngine.rotationX = GLKMathDegreesToRadians(90);
        self.leftEngine.rotationY = -GLKMathDegreesToRadians(90);
        self.rightEngine = [[Engine2 alloc] initWithShader:shader];
        self.rightEngine.rotationX = GLKMathDegreesToRadians(90);
        self.rightEngine.rotationY = -GLKMathDegreesToRadians(90);
        self.leftEngine.shadowMatrix = [self.pod getShadowMatrix:-0.8];
        self.rightEngine.shadowMatrix = [self.pod getShadowMatrix:-0.8];
    }
    return self;
}


- (void)setScaleX:(float)scaleX {
    self.pod.scaleX = scaleX;
//    self.leftEngine.scaleX = scaleX;
//    self.rightEngine.scaleX = scaleX;
    [self setPosition:_position];
}

- (void)setScaleY:(float)scaleY {
    self.pod.scaleY = scaleY;
//    self.leftEngine.scaleY = scaleY;
//    self.rightEngine.scaleY = scaleY;
    [self setPosition:_position];
}

- (void)setScaleZ:(float)scaleZ {
    self.pod.scaleZ = scaleZ;
//    self.leftEngine.scaleZ = scaleZ;
//    self.rightEngine.scaleZ = scaleZ;
    [self setPosition:_position];
}

- (void)setPosition:(GLKVector3)position {
    _position = GLKVector3Make(position.x, position.y, position.z);
    self.pod.position = GLKVector3Make(position.x, position.y - 0.5, position.z);
    self.leftEngine.position = GLKVector3Make(position.x-1.2*self.pod.scaleX, position.y + 6*self.pod.scaleY, position.z-0.1);
    self.rightEngine.position = GLKVector3Make(position.x+1.2*self.pod.scaleX, position.y + 6*self.pod.scaleY, position.z-0.1);
}

- (void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix {
    [self.pod renderWithParentModelViewMatrix:parentModelViewMatrix];
    [self.leftEngine renderWithParentModelViewMatrix:parentModelViewMatrix];
    [self.rightEngine renderWithParentModelViewMatrix:parentModelViewMatrix];
}

- (void)updateWithDelta:(GLfloat)aDelta {
    self.leftEngine.rotationY += aDelta*2;
    self.rightEngine.rotationY -= aDelta*2;

    self.leftEngine.shadowMatrix = GLKMatrix4Identity;
    self.rightEngine.shadowMatrix = GLKMatrix4Identity;
    self.leftEngine.position = GLKVector3Make(self.leftEngine.position.x-aDelta*4, self.leftEngine.position.y , self.leftEngine.position.z + 0.8);
    self.rightEngine.position = GLKVector3Make(self.rightEngine.position.x+aDelta*4, self.rightEngine.position.y , self.rightEngine.position.z + 0.7);
}

@end
