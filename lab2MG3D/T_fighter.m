//
//  T_fighter.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 01.11.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "T_fighter.h"
#import "fighterModel.h"

@implementation T_fighter

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"t_fighter" shader:shader vertices:(MyVertex *)Icosphere_Icosphere_005_None_Vertices vertexCount:sizeof(Icosphere_Icosphere_005_None_Vertices)/sizeof(Icosphere_Icosphere_005_None_Vertices[0])]) {
        [self loadTexture:@"gray.jpg"];
        self.rotationX = GLKMathDegreesToRadians(-90);
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    
    //    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
    
}

@end
