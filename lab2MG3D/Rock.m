//
//  Rock.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Rock.h"
#import "rockWideModel.h"

@implementation Rock
- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"RockRight" shader:shader vertices:(MyVertex *)Plane_None_Vertices vertexCount:sizeof(Plane_None_Vertices)/sizeof(Plane_None_Vertices[0])]) {
        [self loadTexture:@"rock.jpg"];
        self.scaleX = 5;
        self.scaleY = 5;
        self.scaleZ = 2;
        self.rotationX = GLKMathDegreesToRadians(90);
        self.rotationY = -GLKMathDegreesToRadians(90);
    }
    return self;
}
@end
