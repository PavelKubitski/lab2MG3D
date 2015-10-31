//
//  BaseEffect.h
//  lab2MG3D
//
//  Created by Pavel Kubitski on 23.09.15.
//  Copyright (c) 2015 Pavel Kubitski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GLKit;

@interface BaseEffect : NSObject {
    GLuint fragmentShaderBlackName;
    GLuint fragmentShaderName;
    GLuint vertexShaderName;
}

@property (nonatomic, assign) GLuint programHandle;
@property (nonatomic, assign) GLKMatrix4 projectionMatrix;
@property (nonatomic, assign) GLKMatrix4 modelViewMatrix;
//@property (nonatomic, assign) GLKMatrix4 matrix;
@property (assign) GLuint texture;


- (id)initWithVertexShader:(NSString *)vertexShader
            fragmentShader:(NSString *)fragmentShader
       fragmentShaderBlack:(NSString *)fragmentShaderBlack;
- (void)prepareToDraw:(BOOL)shadow;
@end
