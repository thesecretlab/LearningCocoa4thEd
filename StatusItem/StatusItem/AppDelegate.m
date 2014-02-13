//
//  AppDelegate.m
//  StatusItem
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()
{
	NSStatusItem *statusItem;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	
	statusItem.title = @"Test";
	statusItem.menu = self.menu;
	statusItem.highlightMode = YES;
}

- (IBAction)quit:(id)sender
{
	[[NSApplication sharedApplication] terminate:nil];
}
@end
