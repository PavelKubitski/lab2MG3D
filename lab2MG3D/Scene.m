//
//  Scene.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 30.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "Scene.h"
#import "Engine1.h"
#import "Pod1.h"
#import "Engine2Model.h"
#import "Podrace.h"
#import "Podrace2.h"
#import "Rock.h"
#import "Enemy.h"
#import "Stone.h"
#import "BackStage.h"
#import "Bullet.h"
#import "MusicEffect.h"
#import "T_fighter.h"
#import "falcon.h"
#import "Laser.h"
#import "BaseEffect.h"

@interface Scene ()
@property (nonatomic, assign) CGSize area;
@property (nonatomic, assign) float sceneOffset;
@property (nonatomic, strong) Podrace *podrace;
@property (nonatomic, strong) Podrace2 *podrace2;
@property (nonatomic, strong) Rock *rockRight;
@property (nonatomic, strong) Rock *rockLeft;
@property (nonatomic, strong) Enemy *enemy;
@property (nonatomic, strong) Stone *stone;
@property (nonatomic, strong) Bullet *bullet;
@property (nonatomic, strong) T_fighter *fighter1;
@property (nonatomic, strong) T_fighter *fighter2;
@property (nonatomic, strong) falcon *falcon;
//@property (nonatomic, strong) BaseEffect *shader1;
@property (nonatomic, strong) Laser *laser;
@property (nonatomic, strong) Laser *laser2;
@end


@implementation Scene
- (instancetype)initWithShader:(BaseEffect *)shader {
    if (self = [super initWithName:"Scene" shader:shader vertices:nil vertexCount:0]) {
        
        self.shader = shader;
        self.area = CGSizeMake(27, 48);
        self.sceneOffset = self.area.height/2 / tanf(GLKMathDegreesToRadians(85.0/2));
        self.position = GLKVector3Make(-self.area.width/2, -self.area.height/2 + 10, -_sceneOffset);
        self.rotationX = GLKMathDegreesToRadians(-90);
        
        self.podrace = [[Podrace alloc] initWithShader:shader];
        self.podrace.position = GLKVector3Make(self.area.width/4*3, -10, 0);

        self.podrace.scaleX = 1.2;
        self.podrace.scaleY = 1.2;
        self.podrace.scaleZ = 1.2;
        
        self.podrace2 = [[Podrace2 alloc] initWithShader:shader];
        self.podrace2.position = GLKVector3Make(self.area.width/4, -10, 0);
        self.podrace2.scaleX = 1.2;
        self.podrace2.scaleY = 1.2;
        self.podrace2.scaleZ = 1.2;
        

        

        self.fighter1 = [[T_fighter alloc] initWithShader:self.shader];
        self.fighter1.position = GLKVector3Make(100, 50, 70);
        self.fighter1.shadowMatrix = [self.fighter1 getShadowMatrix:-50];

        self.laser = [[Laser alloc] initWithShader:shader];
        self.laser.position = GLKVector3Make(self.fighter1.position.x, self.fighter1.position.y, self.fighter1.position.z);
        self.laser.shadowMatrix = GLKMatrix4Identity;
        
        self.laser2 = [[Laser alloc] initWithShader:shader];
        self.laser2.position = GLKVector3Make(self.fighter1.position.x, self.fighter1.position.y, self.fighter1.position.z);
        self.laser2.shadowMatrix = GLKMatrix4Identity;
        
        self.fighter2 = [[T_fighter alloc] initWithShader:self.shader];
        self.fighter2.position = GLKVector3Make(100, 50, 50);
        self.fighter2.shadowMatrix = [self.fighter2 getShadowMatrix:-50];
        
        self.falcon = [[falcon alloc] initWithShader:self.shader];
        self.falcon.position = GLKVector3Make(80, 50, 60);
        self.falcon.shadowMatrix = [self.falcon getShadowMatrix:-100];
        
        self.rockRight = [[Rock alloc] initWithShader:self.shader];
        self.rockRight.position = GLKVector3Make(self.area.width+5, self.area.height/2+5, 0);
        self.rockRight.shadowMatrix = [self.rockRight getShadowMatrix:-10];
        
        self.enemy = [[Enemy alloc] initWithShader:self.shader];
        self.enemy.position = GLKVector3Make(-1, 30, 10);
        self.enemy.shadowMatrix = [self.enemy getShadowMatrix:0];
        
        self.bullet = [[Bullet alloc] initWithShader:self.shader];
        self.bullet.position = GLKVector3Make(-1, 30, 10);

        self.rockLeft = [[Rock alloc] initWithShader:self.shader];
        self.rockLeft.position = GLKVector3Make(-31, self.area.height/2+5, 0);
        self.rockLeft.shadowMatrix = [self.rockLeft getShadowMatrix:-1];
        
        self.stone = [[Stone alloc] initWithShader:self.shader];
        self.stone.position = GLKVector3Make(self.area.width/2, 50, 0);
        self.stone.shadowMatrix = [self.stone getShadowMatrix:0];
        
        
        [self.children addObject:self.podrace];
        [self.children addObject:self.podrace2];
        [self.children addObject:self.rockRight];
        [self.children addObject:self.rockLeft];
        [self.children addObject:self.enemy];
        [self.children addObject:self.stone];
        [self.children addObject:self.laser];
        [self.children addObject:self.laser2];
    }
    return self;
}


- (void)updateWithDelta:(GLfloat)aDelta {
    if (self.podrace2.position.y > 18) {
        if (self.podrace2.position.y > 18 && self.podrace2.position.y < 19) {
//            [[MusicEffect sharedInstance] playPopEffect];
            if ([self.children indexOfObject:self.bullet] == NSNotFound) {
                [self.children addObject:self.bullet];
            }
        }
        self.bullet.position = GLKVector3Make(self.bullet.position.x+aDelta, self.bullet.position.y, self.bullet.position.z-aDelta*1.6);
    }
    if (self.podrace2.position.y <= 25) {
        self.podrace2.position = GLKVector3Make(self.podrace2.position.x, self.podrace2.position.y + aDelta, self.podrace2.position.z);
    } else if (self.podrace2.position.y > 25 && self.podrace2.position.y < 40 ) {
        self.podrace2.position = GLKVector3Make(self.podrace2.position.x+aDelta/3.5, self.podrace2.position.y + aDelta, self.podrace2.position.z);
        if (self.bullet) {
            [self.children removeObject:self.bullet];
        }
        if (self.podrace2.position.y > 39 && self.podrace2.position.y < 40) {
//            [[MusicEffect sharedInstance] playFlashEffect];
        }
    } else if (self.podrace2.position.y >= 40) {
        [self.podrace2 updateWithDelta:0.2];

    }
    
    if (self.podrace.position.y >= 27 && self.podrace.position.y <= 64) {
        if ([self.children indexOfObject:self.fighter1] == NSNotFound &&
            [self.children indexOfObject:self.fighter2] == NSNotFound &&
            [self.children indexOfObject:self.falcon] == NSNotFound) {
            [self.children addObject:self.fighter1];
            [self.children addObject:self.fighter2];
            [self.children addObject:self.falcon];
        }

        self.fighter1.position = GLKVector3Make(self.fighter1.position.x - 1, self.fighter1.position.y, self.fighter1.position.z);
        self.fighter2.position = GLKVector3Make(self.fighter2.position.x - 1, self.fighter2.position.y, self.fighter2.position.z);
        self.falcon.position = GLKVector3Make(self.falcon.position.x - 1, self.falcon.position.y, self.falcon.position.z);
        self.laser.position = GLKVector3Make(self.fighter1.position.x, self.fighter1.position.y, self.fighter1.position.z);
        self.laser2.position = GLKVector3Make(self.fighter2.position.x, self.fighter2.position.y, self.fighter2.position.z);
    }
    
    if (self.podrace.position.y >= 65 && self.podrace.position.y <= 78) {
        [self.falcon updateWithDelta:0.5];
        
        self.fighter1.position = GLKVector3Make(self.fighter1.position.x - 1, self.fighter1.position.y, self.fighter1.position.z);
        self.fighter2.position = GLKVector3Make(self.fighter2.position.x - 1, self.fighter2.position.y, self.fighter2.position.z);
        self.falcon.position = GLKVector3Make(self.falcon.position.x - 1, self.falcon.position.y, self.falcon.position.z);
        self.laser.position = GLKVector3Make(self.laser.position.x-3, self.laser.position.y, self.laser.position.z-1);
        self.laser2.position = GLKVector3Make(self.fighter2.position.x, self.fighter2.position.y, self.fighter2.position.z);
    }
    
    if (self.podrace.position.y >= 79 && self.podrace.position.y <= 94) {
        self.fighter1.position = GLKVector3Make(self.fighter1.position.x - 1, self.fighter1.position.y, self.fighter1.position.z);
        self.fighter2.position = GLKVector3Make(self.fighter2.position.x - 1, self.fighter2.position.y, self.fighter2.position.z);
        self.falcon.position = GLKVector3Make(self.falcon.position.x - 1, self.falcon.position.y, self.falcon.position.z);
        self.laser.position = GLKVector3Make(self.laser.position.x-3, self.laser.position.y, self.laser.position.z-1);
        self.laser2.position = GLKVector3Make(self.fighter2.position.x, self.fighter2.position.y, self.fighter2.position.z);
    }

    if (self.podrace.position.y >= 95 && self.podrace.position.y <= 109) {
        [self.falcon updateWithDelta:0.45];
        self.fighter1.position = GLKVector3Make(self.fighter1.position.x - 1, self.fighter1.position.y, self.fighter1.position.z);
        self.fighter2.position = GLKVector3Make(self.fighter2.position.x - 1, self.fighter2.position.y, self.fighter2.position.z);
        self.falcon.position = GLKVector3Make(self.falcon.position.x - 1, self.falcon.position.y, self.falcon.position.z);
        self.laser.position = GLKVector3Make(self.laser.position.x-3, self.laser.position.y, self.laser.position.z-1);
        self.laser2.position = GLKVector3Make(self.laser2.position.x-3, self.laser2.position.y-0.1, self.laser2.position.z+1);
    }
    if (self.podrace.position.y >= 110 ) {
        self.fighter1.position = GLKVector3Make(self.fighter1.position.x - 1, self.fighter1.position.y, self.fighter1.position.z);
        self.fighter2.position = GLKVector3Make(self.fighter2.position.x - 1, self.fighter2.position.y, self.fighter2.position.z);
        self.falcon.position = GLKVector3Make(self.falcon.position.x - 1, self.falcon.position.y, self.falcon.position.z);
        self.laser.position = GLKVector3Make(self.laser.position.x-3, self.laser.position.y, self.laser.position.z-1);
        self.laser2.position = GLKVector3Make(self.laser2.position.x-3, self.laser2.position.y, self.laser2.position.z+1);
    }
    
    self.podrace.position = GLKVector3Make(self.podrace.position.x, self.podrace.position.y + aDelta, self.podrace.position.z);
    
    [self.podrace updateWithDelta:0.1];
}

@end
