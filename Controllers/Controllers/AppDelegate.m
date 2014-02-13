//
//  AppDelegate.m
//  Controllers
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"
#import <GameController/GameController.h>

@interface AppDelegate()
@property (nonatomic,strong)GCController *myController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSArray *controllers = [GCController controllers];
	
	if (controllers.count != 0)
	{
		// grabbing hold of the controller and setting it to have no playerindex
		self.myController = controllers[0];
		self.myController.playerIndex = GCControllerPlayerIndexUnset;
		if (self.myController.extendedGamepad)
		{
			NSLog(@"controller is an extended controller");
			// adding a callback handler when any element in the controller change
			GCExtendedGamepad *profile = self.myController.extendedGamepad;
			profile.valueChangedHandler = ^(GCExtendedGamepad *gamepad, GCControllerElement *element)
			{
				if (element == gamepad.rightTrigger)
					if (gamepad.rightTrigger.isPressed)
						NSLog(@"right trigger pressed");
			};
			profile.rightTrigger.valueChangedHandler = ^(GCControllerButtonInput *button,float value,BOOL pressed)
			{
				if(pressed)
					NSLog(@"right trigger pressed");
			};
		}
		else
		{
			NSLog(@"controller is a simple controller");
		}
	}
	else
	{
		NSLog(@"no controllers detected");
		// fallback to other control option
	}
}

@end
