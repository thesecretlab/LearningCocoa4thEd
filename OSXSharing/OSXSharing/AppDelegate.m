//
//  AppDelegate.m
//  OSXSharing
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

- (IBAction)shareImage:(id)sender {
    
    NSButton* shareButton = sender;
    
    NSSharingServicePicker* picker = [[NSSharingServicePicker alloc] initWithItems:@[self.imageView.image]];
    
    [picker showRelativeToRect:shareButton.bounds ofView:shareButton preferredEdge:NSMaxYEdge];
}

- (IBAction)shareText:(id)sender {
    NSButton* shareButton = sender;
    
    NSSharingServicePicker* picker = [[NSSharingServicePicker alloc] initWithItems:@[self.textField.stringValue]];
    
    [picker showRelativeToRect:shareButton.bounds ofView:shareButton preferredEdge:NSMaxYEdge];
}

@end
