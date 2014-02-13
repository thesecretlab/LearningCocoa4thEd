//
//  Document.m
//  OSXDocuments
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "Document.h"

@implementation Document
@synthesize textField;
@synthesize text;

@synthesize checkbox;
@synthesize checked;

#define USE_JSON

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    
    if (self.text == nil)
        self.text = @"";
    
    textField.stringValue = self.text;
    checkbox.intValue = self.checked;

}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    self.text = textField.stringValue;
    
#ifdef USE_JSON
    self.checked = checkbox.intValue;

    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setValue:[NSNumber numberWithBool:self.checked] forKey:@"checked"];
    [dictionary setValue:self.text forKey:@"text"];
    
    NSError* error = nil;
    NSData* serialisedData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    
    if (serialisedData == nil || error != nil)
        return nil;
    
    return serialisedData;
#else
    return [self.text dataUsingEncoding:NSUTF8StringEncoding];
#endif
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    
#ifdef USE_JSON
    NSDictionary* loadedDictionary;
    
    NSError* error = nil;
    
    loadedDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (loadedDictionary == nil || error != nil)
        return NO;
    
    self.text = [loadedDictionary valueForKey:@"text"];
    self.checked = [[loadedDictionary valueForKey:@"checked"] boolValue];
    
#else
    
    if ([data length] > 0) {
        NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.text = string;
    } else {
        self.text = @"";
    }
#endif
        
    return YES;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
