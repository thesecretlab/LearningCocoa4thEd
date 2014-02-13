//
//  AppDelegate.m
//  MultipleWindows
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()
@property (nonatomic,strong)UIWindow *secondWindow;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	NSNotificationCenter *centre = [NSNotificationCenter defaultCenter];
	[centre addObserver:self selector:@selector(screenDidConnect:) name:UIScreenDidConnectNotification object:nil];
	[centre addObserver:self selector:@selector(screenDidDisconnect:) name:UIScreenDidDisconnectNotification object:nil];
	
    return YES;
}
- (void)screenDidConnect:(NSNotification *)notification
{
	UIScreen *screen = [notification object];
	if (!self.secondWindow)
	{
		self.secondWindow = [[UIWindow alloc] initWithFrame:screen.bounds];
		self.secondWindow.screen = screen;
		
		UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
		UIViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"secondWindowVC"];
		self.secondWindow.rootViewController = secondVC;
	}
}
- (void)screenDidDisconnect:(NSNotification *)notifcation
{
	if (self.secondWindow)
	{
		self.secondWindow.hidden = YES;
		self.secondWindow = nil;
	}
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
