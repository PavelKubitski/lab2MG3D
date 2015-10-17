//
//  BackStage.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 02.10.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "BackStage.h"
//#import "sandSkyModel.h"
#import "sandSkyModel.h"

@implementation BackStage
- (instancetype)initWithShader:(BaseEffect*) shader
{
    if (self = [super initWithName:"Sky" shader:shader vertices:(MyVertex *)Plane_None_Verticess vertexCount:sizeof(Plane_None_Verticess)/sizeof(Plane_None_Verticess[0])]) {
        [self loadTexture:@"SkyAndSand.jpg"];
//        [self loadTexture:@"sandAndSky.jpeg"];
        self.scaleX = 10;
        self.scaleY = 10;
        self.scaleZ = 10;
//        self.rotationX = GLKMathDegreesToRadians(90);
        self.rotationY = GLKMathDegreesToRadians(-90);
    }
    return self;
}

@end
