//
//  Document.h
//  OSXDocuments
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
@property (strong) NSString* text;
@property (assign) BOOL checked;
@property (strong) IBOutlet NSButton *checkbox;
@property (strong) IBOutlet NSTextField *textField;

@end
