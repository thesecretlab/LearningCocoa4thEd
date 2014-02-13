//
//  AppDelegate.m
//  VideoPlayer
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate()
{
	AVPlayer *player;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSURL* contentURL = [[NSBundle mainBundle] URLForResource:@"TestVideo" withExtension:@"m4v"];
    player = [AVPlayer playerWithURL:contentURL];
    
    AVPlayerLayer* playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    [self.playerView.layer addSublayer:playerLayer];
    playerLayer.frame = self.playerView.layer.bounds;
    playerLayer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
	
    player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
}

- (IBAction)play:(id)sender {
	[player play];
}

- (IBAction)playSlowMotion:(id)sender {
	[player setRate:0.25];
}

- (IBAction)rewind:(id)sender {
	[player seekToTime:kCMTimeZero];
}
@end
