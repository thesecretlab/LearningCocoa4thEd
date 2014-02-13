//
//  SampleDocument.m
//  iOSDocuments
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "SampleDocument.h"

@implementation SampleDocument


- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName
				   error:(NSError *__autoreleasing *)outError
{
	// Cast the contents variable to an NSData, for convenience
	NSData* data = contents;
	if ([data length] > 0)
	{
		// The file isn't empty, so create a string from its contents
		self.text = [[NSString alloc] initWithData:data
										  encoding:NSUTF8StringEncoding];
	}
	else
	{
		self.text = @"";
	}
	return YES;
}

// Called when the system needs a snapshot of the current state of the document, for autosaving.
- (id)contentsForType:(NSString *)typeName
				error:(NSError *__autoreleasing *)outError
{
	if (self.text == nil)
		self.text = @"";
	return [self.text dataUsingEncoding:NSUTF8StringEncoding];
}

@end
