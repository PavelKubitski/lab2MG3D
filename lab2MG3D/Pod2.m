//
//  Pod2.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Pod2.h"

@implementation Pod2

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Pod2" shader:shader vertices:(MyVertex *)Icosphere_None_Vertices vertexCount:sizeof(Icosphere_None_Vertices)/sizeof(Icosphere_None_Vertices[0])]) {
        [self loadTexture:@"dmetal.jpg"];
        self.scaleX = 1;
        self.scaleY = 1;
        self.scaleZ = 1;
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    //    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
}

@end
