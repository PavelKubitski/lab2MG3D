//
//  Enemy.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 29.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Model.h"
#import "enemyModel.h"

@interface Enemy : Model

- (instancetype)initWithShader:(BaseEffect *)shader;

@end
