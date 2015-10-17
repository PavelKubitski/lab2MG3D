//
//  Engine2Model.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 28.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Model.h"
#import "engine2Model.h"

@interface Engine2 : Model
- (instancetype)initWithShader:(BaseEffect *)shader;
@end
