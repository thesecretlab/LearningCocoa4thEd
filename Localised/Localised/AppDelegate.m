//
//  AppDelegate.m
//  Localised
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSString *currentLangauge = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
	NSString *labelFormat = NSLocalizedString(@"main language: %@", nil);
	self.languagesLabel.stringValue = [NSString stringWithFormat:labelFormat,currentLangauge];
}

@end
