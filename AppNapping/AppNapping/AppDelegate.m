//
//  AppDelegate.m
//  AppNapping
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
}

- (void)applicationDidChangeOcclusionState:(NSNotification *)notification
{
	if ([NSApp occlusionState] & NSApplicationOcclusionStateVisible)
		NSLog(@"You are in the foreground, go nuts");
	else
		NSLog(@"You are in the background, slow down");
}

@end
