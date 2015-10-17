//
//  Pod1.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 28.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Pod1.h"

@implementation Pod1

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Pod1" shader:shader vertices:(MyVertex *)Sphere_None_Vertices vertexCount:sizeof(Sphere_None_Vertices)/sizeof(Sphere_None_Vertices[0])]) {
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
