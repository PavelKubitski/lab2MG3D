//
//  Engine2left.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.10.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Engine2left.h"
#import "engine2leftModel.h"

@implementation Engine2left

- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Engine2left" shader:shader vertices:(MyVertex *)Circle_None_Vertices1 vertexCount:sizeof(Circle_None_Vertices1)/sizeof(Circle_None_Vertices1[0])]) {
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
