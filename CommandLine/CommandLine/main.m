//
//  main.m
//  CommandLine
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        for (int i = 10; i > 0; i--) {
            NSLog(@"%i green bottles, standing on the wall", i);
            NSLog(@"%i green bottles, standing on the wall", i);
            NSLog(@"And if one green bottle should accidentally fall");
            NSLog(@"There'll be %i green bottles, standing on the wall\n\n", i-1);
        }
        
    }
    return 0;
}

