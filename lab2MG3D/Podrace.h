//
//  Podrace.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 28.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pod1.h"
#import "Engine1.h"
#import "Model.h"

@interface Podrace : Model

@property (nonatomic, strong) Pod1 *pod;
@property (nonatomic, strong) Engine1 *leftEngine;
@property (nonatomic, strong) Engine1 *rightEngine;


- (instancetype)initWithShader:(BaseEffect *)shader;

@end
