//
//  ViewController.m
//  DynamicSnap
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UISnapBehavior *snap;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapped:(id)sender
{
	UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
	CGPoint point = [tap locationInView:self.view];
	
	[self.animator removeBehavior:self.snap];
	
	UISnapBehavior *newSnap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:point];
	self.snap = newSnap;
    [self.animator addBehavior:self.snap];
}
@end
