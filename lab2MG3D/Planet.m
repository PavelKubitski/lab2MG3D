//
//  Planet.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 04.10.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Planet.h"
#import "planetModel.h"
@implementation Planet

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Planet" shader:shader vertices:(MyVertex *)Sphere_None_Verticess vertexCount:sizeof(Sphere_None_Verticess)/sizeof(Sphere_None_Verticess[0])]) {
        [self loadTexture:@"jupitermap.jpg"];

//        self.rotationX = GLKMathDegreesToRadians(90);
//        self.rotationY = -GLKMathDegreesToRadians(90);
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    
    //    self.rotationX += aDelta;
    self.rotationY += aDelta;
    
}


@end
