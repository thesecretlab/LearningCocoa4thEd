//
//  MasterViewController.m
//  iOSDocuments
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "MasterViewController.h"
#import "SampleDocument.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (NSURL*)URLforDocuments
{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
- (void) updateFileList
{
	_objects = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:[self URLforDocuments] includingPropertiesForKeys:nil options:0 error:nil];
	[self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self updateFileList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FileCell" forIndexPath:indexPath];
	
	NSURL *url = [_objects objectAtIndex:indexPath.row];
	cell.textLabel.text = [url lastPathComponent];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSURL *url = [_objects objectAtIndex:indexPath.row];
	
	SampleDocument *document = [[SampleDocument alloc] initWithFileURL:url];
	[document openWithCompletionHandler:^(BOOL success) {
		[self performSegueWithIdentifier:@"showDetail" sender:document];
	}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	DetailViewController *detailViewController = segue.destinationViewController;
	
	if ([segue.identifier isEqualToString:@"showDetail"])
	{
		SampleDocument *document = sender;
		detailViewController.detailItem = document;
	}
}

- (IBAction)createDocument:(id)sender
{
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZZZ"];
	NSString* fileName = [NSString stringWithFormat: @"Document %@.sampleDocument", [formatter stringFromDate:[NSDate date]]];
	NSURL* url = [[self URLforDocuments] URLByAppendingPathComponent:fileName];
	
	SampleDocument* document = [[SampleDocument alloc] initWithFileURL:url];
	[document saveToURL:url
	   forSaveOperation:UIDocumentSaveForCreating
	  completionHandler:^(BOOL success) {
		  [self performSegueWithIdentifier:@"showDetail" sender:document];
	  }];
}
@end
