//
//  AppDelegate.h
//  Location
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,CLLocationManagerDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *latitudeLabel;
@property (weak) IBOutlet NSTextField *longitudeLabel;
@property (weak) IBOutlet NSTextField *accuracyLabel;
@property (weak) IBOutlet NSTextField *addressLabel;
@property (weak) IBOutlet NSProgressIndicator *spinner;

@end
