//
//  AppDelegate.h
//  VideoPlayerWithAVKit
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet AVPlayerView *aPlayerView;

@end
