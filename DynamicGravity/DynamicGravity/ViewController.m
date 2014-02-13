//
//  ViewController.m
//  DynamicGravity
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
	{
		[super viewDidAppear:animated];
		
		_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
		
		UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
		[_animator addBehavior:gravity];
		
		UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.imageView]];
		collision.translatesReferenceBoundsIntoBoundary = YES;
		[_animator addBehavior:collision];
	}
	
@end
