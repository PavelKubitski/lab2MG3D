//
//  Stone.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Stone.h"

@implementation Stone
- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Stone" shader:shader vertices:(MyVertex *)Circle_Circle_002_None_Vertices vertexCount:sizeof(Circle_Circle_002_None_Vertices)/sizeof(Circle_Circle_002_None_Vertices[0])]) {
        [self loadTexture:@"rock.jpg"];
        self.scaleX = 2;
        self.scaleY = 2;
        self.scaleZ = 2;
        self.rotationX = GLKMathDegreesToRadians(90);
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    
    //    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
}
@end
