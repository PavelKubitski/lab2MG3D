//
//  Engine2Model.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 28.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Engine2.h"

@implementation Engine2

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Engine2" shader:shader vertices:(MyVertex *)Circle_None_Vertices vertexCount:sizeof(Circle_None_Vertices)/sizeof(Circle_None_Vertices[0])]) {
        [self loadTexture:@"darkMetal.jpg"];
        self.scaleX = 2.5;
        self.scaleY = 2.5;
        self.scaleZ = 2.5;
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    
    //    self.rotationX += aDelta;
    self.rotationY += aDelta*3;
    
}


@end
