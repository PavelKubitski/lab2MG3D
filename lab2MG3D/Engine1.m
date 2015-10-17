//
//  Engine1.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 27.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Engine1.h"

#import "engineModel.h"
@implementation Engine1


- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Engine1" shader:shader vertices:(MyVertex *)Cube_002_Cube_011_None_Vertices vertexCount:sizeof(Cube_002_Cube_011_None_Vertices)/sizeof(Cube_002_Cube_011_None_Vertices[0])]) {
        [self loadTexture:@"metal1.jpg"];
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
