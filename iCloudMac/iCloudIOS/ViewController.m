//
//  ViewController.m
//  iCloudIOS
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMetadataQuery* metadataQuery;
}

@end

@implementation ViewController
@synthesize fileList;
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyValueStoreDidChange:) name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:[NSUbiquitousKeyValueStore defaultStore]];

    self.textField.text = [[NSUbiquitousKeyValueStore defaultStore] stringForKey:@"cloud_string"];
    
    metadataQuery = [[NSMetadataQuery alloc] init];
    [metadataQuery setSearchScopes:[NSArray arrayWithObject:NSMetadataQueryUbiquitousDocumentsScope]];
    
    [metadataQuery setPredicate:[NSPredicate predicateWithFormat:@"%K LIKE '*'", NSMetadataItemFSNameKey]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryDidUpdate:)                                                  name:NSMetadataQueryDidUpdateNotification object:metadataQuery];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryDidUpdate:)                                                  name:NSMetadataQueryDidFinishGatheringNotification object:metadataQuery];

    
    [metadataQuery startQuery];
    
    self.fileList.text = @"";
}


- (void) queryDidUpdate:(NSNotification*)notification {
    NSMutableArray* files = [NSMutableArray array];
    
    for (NSMetadataItem* item in metadataQuery.results) {
        NSURL *filename = [item valueForAttribute:NSMetadataItemPathKey];
        [files addObject:filename];
    }
    
    self.fileList.text = [files description];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    [[NSUbiquitousKeyValueStore defaultStore] setString:self.textField.text forKey:@"cloud_string"];
    return NO;
}

- (void) keyValueStoreDidChange:(NSNotification*)notification {
    self.textField.text = [[NSUbiquitousKeyValueStore defaultStore] stringForKey:@"cloud_string"];
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setFileList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
