//
//  RWTMusicEffect.m
//  HelloOpenGL
//
//  Created by Pavel Kubitski on 19.09.15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import "MusicEffect.h"

@implementation MusicEffect {
    AVAudioPlayer *_backgroundMusicPlayer;
    AVAudioPlayer *_popEffect;
    AVAudioPlayer *_flashEffect;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    static MusicEffect *_sharedInstance;
    dispatch_once(&pred, ^{ _sharedInstance = [[self alloc] init]; });
    return _sharedInstance;
}

- (instancetype)init {
    if ((self = [super init])) {
        _popEffect = [self preloadSoundEffect:@"Shut.mp3"];
        _flashEffect = [self preloadSoundEffect:@"Flash.mp3"];
    }
    return self;
}

- (void)playBackgroundMusic:(NSString *)filename {
    _backgroundMusicPlayer = [self preloadSoundEffect:filename];
    _backgroundMusicPlayer.numberOfLoops = -1;
    _backgroundMusicPlayer.volume = 0.1;
    [_backgroundMusicPlayer play];
}

- (AVAudioPlayer *)preloadSoundEffect:(NSString *)filename {
    NSURL *URL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    AVAudioPlayer *retval = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    [retval prepareToPlay];
    return retval;
}

- (void)playPopEffect {
   [_popEffect play];
}

- (void)playFlashEffect {
    [_flashEffect play];
}



@end
