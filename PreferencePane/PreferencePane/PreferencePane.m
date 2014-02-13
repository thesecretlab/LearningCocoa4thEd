//
//  PreferencePane.m
//  PreferencePane
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "PreferencePane.h"

@implementation PreferencePane

- (void)mainViewDidLoad
{
	NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.oreilly.MyAmazingApplication"];
	self.checkbox.state = [[preferences objectForKey:@"isChecked"] boolValue];
}

- (void)didUnselect
{
	NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.oreilly.MyAmazingApplication"];
	NSMutableDictionary *mutablePreferences = [NSMutableDictionary dictionaryWithDictionary:preferences];
	[mutablePreferences setObject:[NSNumber numberWithBool:self.checkbox.state] forKey:@"isChecked"];
	
	[[NSUserDefaults standardUserDefaults] setPersistentDomain:mutablePreferences forName:@"com.oreilly.MyAmazingApplication"];
}

@end
