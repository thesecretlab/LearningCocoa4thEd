//
//  AppDelegate.m
//  Networking
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize imageView = _imageView;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // PlaceKitten.com URLs work like this:
    // http://placekitten.com/<width>/<height>
    
    int width = (int)self.imageView.bounds.size.width;
    int height = (int)self.imageView.bounds.size.height;
    
    NSString* urlString = [NSString stringWithFormat:@"http://placekitten.com/%i/%i", width, height];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
	// simple switch for using NSURLSession or NSURLConnection
	BOOL usingSessions = YES;
	if (usingSessions)
	{
		NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
		[[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
			NSImage *image = [[NSImage alloc] initWithData:data];
			self.imageView.image = image;
		}] resume];
	}
	else
	{
		NSURLRequest* request = [NSURLRequest requestWithURL:url];
		
		[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
			NSImage* image = [[NSImage alloc] initWithData:data];
			self.imageView.image = image;
		}];
	}
}

@end
