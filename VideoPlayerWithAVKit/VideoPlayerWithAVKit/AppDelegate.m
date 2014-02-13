//
//  AppDelegate.m
//  VideoPlayerWithAVKit
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSURL* contentURL = [[NSBundle mainBundle] URLForResource:@"TestVideo" withExtension:@"m4v"];
	
	[self.aPlayerView setPlayer:[AVPlayer playerWithURL:contentURL]];
}

@end
