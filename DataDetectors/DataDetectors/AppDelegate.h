//
//  AppDelegate.h
//  DataDetectors
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSTextField *outputTextField;

- (IBAction)check:(id)sender;
@end
