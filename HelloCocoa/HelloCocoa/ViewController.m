//
//  ViewController.m
//  HelloCocoa
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
													message:@"Hello, World!"
												   delegate:nil
										  cancelButtonTitle:@"Close"
										  otherButtonTitles:nil];
	[alert show];
	
	[self.helloButton setTitle:@"Click!" forState:UIControlStateNormal];
}

@end
