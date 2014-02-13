//
//  AppDelegate.m
//  Networking
//
//  Created by Jon Manning on 30/03/12.
//  Copyright (c) 2012 Secret Lab. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize imageView = _imageView;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // PlaceKitten.com URLs work like this:
    // http://placekitten.com/<width>/<height>
    
    NSInteger width = (int)self.imageView.bounds.size.width;
    NSInteger height = (int)self.imageView.bounds.size.height;
    
    NSString* urlString = [NSString stringWithFormat:@"http://placekitten.com/%i/%i", width, height];
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        NSImage* image = [[NSImage alloc] initWithData:data];
        self.imageView.image = image;
    }];
    
}

@end
