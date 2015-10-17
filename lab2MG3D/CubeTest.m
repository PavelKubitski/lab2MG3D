//
//  CubeTest.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 24.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "CubeTest.h"
#import "cube.h"

@implementation CubeTest

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Cube" shader:shader vertices:(MyVertex *)Cube_Vertices vertexCount:sizeof(Cube_Vertices)/sizeof(Cube_Vertices[0])]) {
        [self loadTexture:@"dmetal.jpg"];
        self.scaleX = 1.2;
        self.scaleY = 1.2;
        self.scaleZ = 1.2;
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    
//    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
    
}

@end
