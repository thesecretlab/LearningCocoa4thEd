//
//  AppDelegate.m
//  DataDetectors
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize inputTextField = _inputTextField;
@synthesize outputTextField = _outputTextField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)check:(id)sender {
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingAllTypes error:nil];
    
    NSString* inputString = self.inputTextField.stringValue;
    NSMutableString* resultsText = [NSMutableString string];
    
    NSArray* matches = [detector matchesInString:inputString options:0 range:NSMakeRange(0, inputString.length)];
    
    for (NSTextCheckingResult* match in matches) {
        switch (match.resultType) {
            case NSTextCheckingTypeLink:
                [resultsText appendFormat:@"Found a link: %@\n", match.URL];
                break;
            case NSTextCheckingTypeDate:
                [resultsText appendFormat:@"Found a date: %@\n", match.date];
                break;
            case NSTextCheckingTypePhoneNumber:
                [resultsText appendFormat:@"Found a phone number: %@\n", match.phoneNumber];
                break;
            case NSTextCheckingTypeAddress:
                [resultsText appendFormat:@"Found an address: %@\n", match.addressComponents];
                break;
            default:
                break;
        }
    }
    
    self.outputTextField.stringValue = resultsText;
}
@end
