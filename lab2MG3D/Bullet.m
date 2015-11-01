//
//  Bullet.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 03.10.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Bullet.h"
#import "bulletModel.h"

@implementation Bullet


- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Bullet" shader:shader vertices:(MyVertex *)Circle_Circle_001_None_Vertices vertexCount:sizeof(Circle_Circle_001_None_Vertices)/sizeof(Circle_Circle_001_None_Vertices[0])]) {
        [self loadTexture:@"yellow.png"];
        self.scaleX = 0.5;
        self.scaleY = 0.5;
        self.scaleZ = 0.5;
        self.rotationX = GLKMathDegreesToRadians(90);
        self.rotationZ = GLKMathDegreesToRadians(-120);
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    
    self.rotationY += aDelta*3;
}




@end
