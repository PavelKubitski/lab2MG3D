//
//  ViewController.m
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import "ViewController.h"
#import "BaseEffect.h"


#import "Scene.h"
#import "BackStage.h"
#import "MusicEffect.h"
#import "Planet.h"

@interface ViewController ()
@property (nonatomic, strong) BaseEffect *shader;

@property (nonatomic, strong) BackStage *backStage;
@property (nonatomic, strong) Scene *scene;
@property (nonatomic, strong) Planet *planet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    view.drawableDepthFormat = GLKViewDrawableDepthFormat16;
    [EAGLContext setCurrentContext:view.context];
    [self setPreferredFramesPerSecond:300];
    CALayer *layer = self.view.layer;
    [layer setOpacity:YES];
    
    [self setupScene];
    
}

- (void)setupScene {
    
//    [[MusicEffect sharedInstance] playBackgroundMusic:@"Rush.mp3"];

    self.shader = [[BaseEffect alloc] initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];

    self.scene = [[Scene alloc] initWithShader:self.shader];
    
    self.backStage = [[BackStage alloc] initWithShader:self.shader];
    self.backStage.position = GLKVector3Make(0, -20, -35);
    
    self.planet = [[Planet alloc] initWithShader:self.shader];
    self.planet.position = GLKVector3Make(15, 20, -50);

    _shader.projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(85.0), self.view.bounds.size.width/self.view.bounds.size.height, 1, 150);
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {

    
    glClearColor(1, 1, 51/255.0, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    
    
//  GLKMatrix4 viewMatrix = GLKMatrix4MakeLookAt(0, 0, 0, self.ground.position.x, self.ground.position.y, self.ground.position.z, 0, 1, 0);
    GLKMatrix4 viewMatrix = GLKMatrix4Identity;
//    GLKMatrix4 viewMatrix = GLKMatrix4MakeLookAt(0, 0, 12, 0, 0.1, 0, 0, 1, 0);
    
    [self.scene renderWithParentModelViewMatrix:viewMatrix];
    [self.backStage renderWithParentModelViewMatrix:viewMatrix];
    [self.planet renderWithParentModelViewMatrix:viewMatrix];
    

    
}

- (void) update {
    static float y = 0;
    y = 0.99;
    
    [self.scene updateWithDelta:y];
    [self.planet updateWithDelta:0.02];

}

@end
