//
//  Song.m
//  CocoaTableView
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "Song.h"

@implementation Song

- (NSString*) durationString {
    return [NSString stringWithFormat:@"%i:%02i", (int)self.duration / 60, (int) self.duration % 60];
}

@end
