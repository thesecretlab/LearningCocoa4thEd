//
//  ExampleView.h
//  RetainCycle
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ExampleView;

@protocol ExampleVieDelegate <NSObject>

-(UIColor *)colorForView:(ExampleView *)view;

@end

@interface ExampleView : UIView

@property (strong) IBOutlet id <ExampleVieDelegate> delegate;

@end
