//
//  Enemy.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Enemy" shader:shader vertices:(MyVertex *)Cube_005_Cube_010_None_Vertices vertexCount:sizeof(Cube_005_Cube_010_None_Vertices)/sizeof(Cube_005_Cube_010_None_Vertices[0])]) {
        [self loadTexture:@"black.jpg"];
        self.scaleX = 0.8;
        self.scaleY = 0.8;
        self.scaleZ = 0.8;
        self.rotationY = GLKMathDegreesToRadians(180);
        self.rotationX = GLKMathDegreesToRadians(90);
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    
    //    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
    
}



@end
