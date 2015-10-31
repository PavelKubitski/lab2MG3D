//
//  Podrace2.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Model.h"
#import "Engine2.h"
#import "engine2left.h"
#import "Pod2.h"

@interface Podrace2 : Model {
    float r;
}

@property (nonatomic, strong) Pod2 *pod;
@property (nonatomic, strong) Engine2left *leftEngine;
@property (nonatomic, strong) Engine2 *rightEngine;

- (instancetype)initWithShader:(BaseEffect *)shader;

@end
