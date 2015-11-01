//
//  Laser.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 01.11.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Laser.h"
#import "laserModel.h"

@implementation Laser

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Laser" shader:shader vertices:(MyVertex *)Sphere_Sphere_001_None_Vertices3 vertexCount:sizeof(Sphere_Sphere_001_None_Vertices3)/sizeof(Sphere_Sphere_001_None_Vertices3[0])]) {
        [self loadTexture:@"yellow.png"];
//        self.scaleX = 0.5;
//        self.scaleY = 0.5;
//        self.scaleZ = 0.5;
//        self.rotationX = GLKMathDegreesToRadians(90);
//        self.rotationZ = GLKMathDegreesToRadians(-120);
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    
    self.rotationY += aDelta*3;
}

@end
