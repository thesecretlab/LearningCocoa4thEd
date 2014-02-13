//
//  AppDelegate.m
//  Blocks
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Register a background task. This keeps the app from being
	// terminated until we tell the system that the task is complete.
	UIBackgroundTaskIdentifier backgroundTask = [application beginBackgroundTaskWithExpirationHandler:nil];
	// Make a new background queue to run our background code on.
	NSOperationQueue* backgroundQueue = [[NSOperationQueue alloc] init];
	[backgroundQueue addOperationWithBlock:^{
		// Send a notification to the server.
		// Prepare the URL
		NSURL* notificationURL = [NSURL URLWithString:@"http://www.oreilly.com/"];
		// Prepare the URL request
		NSURLRequest* notificationURLRequest = [NSURLRequest requestWithURL:notificationURL];
		// Send the request, and log the reply
		NSData* loadedData = [NSURLConnection
							  sendSynchronousRequest:notificationURLRequest
							  returningResponse:nil
							  error:nil];
		// Convert the data to a string
		NSString* loadedString = [[NSString alloc] initWithData:loadedData encoding:NSUTF8StringEncoding];
		NSLog(@"Loaded: %@", loadedString);
		// Tell the system that the background task is done
		[application endBackgroundTask:backgroundTask];
	}];
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
