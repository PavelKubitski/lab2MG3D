//
//  Podrace.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 28.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Podrace.h"
#import "BaseEffect.h"

@implementation Podrace
@synthesize position = _position;
- (instancetype)initWithShader:(BaseEffect*) shader
{
    self = [super init];
    if (self) {
        self.pod = [[Pod1 alloc] initWithShader:shader];
        self.leftEngine = [[Engine1 alloc] initWithShader:shader];
        self.rightEngine = [[Engine1 alloc] initWithShader:shader];
        self.pod.rotationX = GLKMathDegreesToRadians(90);
        self.pod.rotationY = -GLKMathDegreesToRadians(90);
    }
    return self;
}


- (void)setScaleX:(float)scaleX {
    self.pod.scaleX = scaleX;
    self.leftEngine.scaleX = scaleX;
    self.rightEngine.scaleX = scaleX;
    [self setPosition:_position];
}

- (void)setScaleY:(float)scaleY {
    self.pod.scaleY = scaleY;
    self.leftEngine.scaleY = scaleY;
    self.rightEngine.scaleY = scaleY;
    [self setPosition:_position];
}

- (void)setScaleZ:(float)scaleZ {
    self.pod.scaleZ = scaleZ;
    self.leftEngine.scaleZ = scaleZ;
    self.rightEngine.scaleZ = scaleZ;
    [self setPosition:_position];
}

- (void)setPosition:(GLKVector3)position {
    _position = GLKVector3Make(position.x, position.y, position.z);
    self.pod.position = GLKVector3Make(position.x, position.y - 0.5, position.z);
    self.leftEngine.position = GLKVector3Make(position.x-1*self.leftEngine.scaleX, position.y + 4*self.leftEngine.scaleY, position.z-0.1);
    self.rightEngine.position = GLKVector3Make(position.x+1.2*self.rightEngine.scaleX, position.y + 4*self.rightEngine.scaleY, position.z-0.1);
}

- (void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix {
    [self.pod renderWithParentModelViewMatrix:parentModelViewMatrix];
    [self.leftEngine renderWithParentModelViewMatrix:parentModelViewMatrix];
    [self.rightEngine renderWithParentModelViewMatrix:parentModelViewMatrix];
}

- (void)updateWithDelta:(GLfloat)aDelta {
//    self.leftEngine.rotationY += aDelta;
//    self.rightEngine.rotationY -= aDelta;
}


@end
