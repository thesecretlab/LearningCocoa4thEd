//
//  ViewController.m
//  iOSSharing
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

- (IBAction)shareText:(id)sender
{
	UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:@[self.textView.text] applicationActivities:nil];
	[self presentViewController:activity animated:YES completion:nil];
}
	
- (IBAction)shareImage:(id)sender
{
	UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:@[self.imageView.image] applicationActivities:nil];
	[self presentViewController:activity animated:YES completion:nil];
}
@end
