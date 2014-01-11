//
//  KoukaonManager.m
//  ChinanagonoUtaTouch
//
//  Created by Yukinaga Azuma on 12/11/02.
//  Copyright (c) 2012年 Yukinaga Azuma. All rights reserved.
//

#import "SEManager.h"
#import "AVFoundation/AVFoundation.h"

@implementation SEManager

static SEManager *sharedData_ = nil;

+ (SEManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[SEManager alloc]init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        soundArray = [[NSMutableArray alloc] init];
        _soundVolume = 1.0;
    }
    return self;
}

- (void)playSound:(NSString *)soundName{
    if (!soundName) {
        return;
    }
    
    NSString *soundPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:soundName];
    NSURL *urlOfSound = [NSURL fileURLWithPath:soundPath];
    AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlOfSound error:nil];
    [player setNumberOfLoops:0];
    player.volume = _soundVolume;
    player.delegate = (id)self;
    [soundArray insertObject:player atIndex:0];
    [player prepareToPlay];
    [player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [soundArray removeObject:player];
}

@end
