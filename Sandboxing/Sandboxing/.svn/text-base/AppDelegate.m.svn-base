//
//  AppDelegate.m
//  Sandboxing
//
//  Created by Jon Manning on 18/07/12.
//  Copyright (c) 2012 Secret Lab. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    
}

@property (readonly) NSArray* files;

@end

@implementation AppDelegate

@dynamic files;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSURL*) fileURL {
    
    NSURL* bookmarkStorageURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    bookmarkStorageURL = [bookmarkStorageURL URLByAppendingPathComponent:@"saved_bookmark.bookmark"];
    
    NSData* bookmarkData = [NSData dataWithContentsOfURL:bookmarkStorageURL];
    
    NSURL* bookmark = nil;
    
    if (bookmarkData) {
        
        BOOL isStale = NO;
        NSError* error = nil;
        bookmark = [NSURL URLByResolvingBookmarkData:bookmarkData options:NSURLBookmarkResolutionWithSecurityScope relativeToURL:nil bookmarkDataIsStale:&isStale error:&error];
        
        [[NSUserDefaults standardUserDefaults] setURL:bookmark forKey:@"path"];
    }
    
    return bookmark;
}

- (NSArray *)files {
    NSURL* url = [self fileURL];
    
    if (url == nil) {
        return nil;
    }
    
    [url startAccessingSecurityScopedResource];
    
    NSError* error = nil;
    
    NSArray* files = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:url includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    
    [url stopAccessingSecurityScopedResource];
    
    return files;
}

- (IBAction)chooseFolder:(id)sender {
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    panel.canChooseFiles = NO;
    panel.canChooseDirectories = YES;
    [panel beginWithCompletionHandler:^(NSInteger result) {
        
        if (result == NSOKButton) {
        
            [self willChangeValueForKey:@"files"];
            [[NSUserDefaults standardUserDefaults] setURL:panel.URL forKey:@"path"];
            
            NSURL* bookmarkStorageURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
            bookmarkStorageURL = [bookmarkStorageURL URLByAppendingPathComponent:@"saved_bookmark.bookmark"];
            
            NSError* error = nil;
            
            NSData* bookmarkData = [panel.URL bookmarkDataWithOptions:NSURLBookmarkCreationWithSecurityScope includingResourceValuesForKeys:nil relativeToURL:nil error:&error];
            
            [bookmarkData writeToURL:bookmarkStorageURL atomically:YES];
            
            [self didChangeValueForKey:@"files"];
            
        }

        
    }];
}

@end
