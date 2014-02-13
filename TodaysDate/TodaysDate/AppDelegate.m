//
//  AppDelegate.m
//  TodaysDate
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize dateLabel = _dateLabel;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    /*
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];*/
    
    [dateFormatter setDateFormat:@"HH:mm, MMMM d"];
    
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    
    
    self.dateLabel.stringValue = [NSString stringWithFormat:@"The current date is %@", dateString];
    
}

@end
