//
//  AppDelegate.m
//  ControllerBindings
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize notes = _notes;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.notes = [NSMutableArray array];
    // Insert code here to initialize your application
}

@end
