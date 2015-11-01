//
//  falcon.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 01.11.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "falcon.h"
#import "sokolModel.h"

@implementation falcon
- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"falcon" shader:shader vertices:(MyVertex *)Circle_Circle_001_None_Vertices2 vertexCount:sizeof(Circle_Circle_001_None_Vertices2)/sizeof(Circle_Circle_001_None_Vertices2[0])]) {
        [self loadTexture:@"gray.jpg"];
        self.rotationX = GLKMathDegreesToRadians(-90);
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    
        self.rotationX += aDelta;
//    self.rotationY += aDelta*3;
    
}

@end
