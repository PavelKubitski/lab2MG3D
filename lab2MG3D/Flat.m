//
//  Flat.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Flat.h"

const static RWTVertex vertices[] = {
    {{1, -1, 0}, {1, 0, 0, 1}}, // V0
    {{1, 1, 0}, {0, 1, 0, 1}}, // V1
    {{-1, 1, 0}, {0, 0, 1, 1}}, // V2
    {{-1, -1, 0}, {0, 0, 0, 0}} // V3
};

const static GLubyte indices[] = {
    0, 1, 2,
    2, 3, 0
};

@implementation Flat

- (instancetype)initWithShader:(RWTBaseEffect *)shader {
    if ((self = [super initWithName:"square" shader:shader vertices:(RWTVertex *)vertices vertexCount:sizeof(vertices)/sizeof(vertices[0]) inidices:(GLubyte *)indices indexCount:sizeof(indices)/sizeof(indices[0])])) {
        
    }
    return self;
}

- (void)updateWithDelta:(GLfloat)aDelta {
    
    float secsPerMove = 2;
    self.position = GLKVector3Make(sinf(CACurrentMediaTime() * 2*M_PI / secsPerMove), self.position.y, self.position.z);
    
}

