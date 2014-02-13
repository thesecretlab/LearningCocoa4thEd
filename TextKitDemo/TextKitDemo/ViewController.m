//
//  ViewController.m
//  TextKitDemo
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(dynamicFontChanged:)
												 name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)dynamicFontChanged:(NSNotification *)notification
{
	self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
