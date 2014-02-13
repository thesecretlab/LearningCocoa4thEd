//
//  ViewController.m
//  Motion
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
	CMMotionManager *_motionManager;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	_motionManager = [[CMMotionManager alloc] init];
}
- (void)viewWillAppear:(BOOL)animated
{
	[_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
										withHandler:^(CMDeviceMotion *motion, NSError *error) {
											self.xLabel.text = [NSString stringWithFormat:@"%.1f",motion.userAcceleration.x];
											self.yLabel.text = [NSString stringWithFormat:@"%.1f",motion.userAcceleration.y];
											self.zLabel.text = [NSString stringWithFormat:@"%.1f",motion.userAcceleration.z];
											
											// convert the angles to degrees
											CGFloat pitchDegress = motion.attitude.pitch * 180 / M_PI;
											CGFloat yawDegress = motion.attitude.yaw * 180 / M_PI;
											CGFloat rollDegress = motion.attitude.roll * 180 / M_PI;
											
											self.pitchLabel.text = [NSString stringWithFormat:@"%.1f",pitchDegress];
											self.yawLabel.text = [NSString stringWithFormat:@"%.1f",yawDegress];
											self.rollLabel.text = [NSString stringWithFormat:@"%.1f",rollDegress];
										}];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[_motionManager stopDeviceMotionUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
