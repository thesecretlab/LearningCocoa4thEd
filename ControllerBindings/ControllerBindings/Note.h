//
//  Note.h
//  ControllerBindings
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSAttributedString* text;
@property (strong) NSDate* created;
@property (strong) NSDate* edited;


@end
