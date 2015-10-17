//
//  RWTMusicEffect.h
//  HelloOpenGL
//
//  Created by Pavel Kubitski on 19.09.15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@import AVFoundation;


@interface MusicEffect : NSObject

+ (instancetype)sharedInstance;
- (void)playBackgroundMusic:(NSString *)filename;
- (AVAudioPlayer *)preloadSoundEffect:(NSString *)filename;
- (void)playPopEffect;
- (void)playFlashEffect;

@end
