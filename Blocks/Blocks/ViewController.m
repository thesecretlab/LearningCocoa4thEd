//
//  ViewController.m
//  Blocks
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
	NSArray *websites;
	NSMutableArray *websiteIcons;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Set up the list of websites that we want to get icons for.
	websites = [NSArray arrayWithObjects:@"google.com", @"amazon.com", @"microsoft.com", @"apple.com", @"oreilly.com", nil];
	websiteIcons = [[NSMutableArray alloc] init];
	
	// For each website in the 'websites' array, insert an NSNull into the
	// website icons array.
	// These NSNulls will be replaced when the images are loaded from the
	// network.
	for (NSString* website in websites)
	{
		[websiteIcons addObject:[NSNull null]];
	}
	
	// Get a new operation queue.
	NSOperationQueue* backgroundQueue = [[NSOperationQueue alloc] init]; int websiteNumber = 0; // for keeping track of which index to
	// insert the new image into
	for (NSString* website in websites)
	{
		[backgroundQueue addOperationWithBlock:^{
			// Construct a URL for the website's icon
			NSURL* iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/favicon.ico", website]];
			// Construct a URL request for this URL
			NSURLRequest* request = [NSURLRequest requestWithURL:iconURL];
			// Load the data
			NSData* loadedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
			if (loadedData != nil)
			{
				// We got image data! Convert it to an image.
				UIImage* loadedImage = [UIImage imageWithData:loadedData];
				// If the data wasn't able to be turned into an image, stop
				if (loadedImage == nil)
				{
					return;
				}
				// If it was, insert the image into the
				// table view on the main queue.
				[[NSOperationQueue mainQueue] addOperationWithBlock:^{
					[websiteIcons replaceObjectAtIndex:websiteNumber
											withObject:loadedImage];
					[self.tableView reloadData];
				}];
			}}];
		websiteNumber++;
	}
	
//	self.edgesForExtendedLayout = UIRectEdgeNone;
//	self.extendedLayoutIncludesOpaqueBars = NO;
//	self.automaticallyAdjustsScrollViewInsets = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// Number of cells = number of websites
	return [websiteIcons count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Get a cell from the table view.
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
	// Take the website name and give that to the cell
	NSString* websiteName = [websites objectAtIndex:indexPath.row];
	cell.textLabel.text = websiteName;
	// If we have an image for this website, give it to the cell
	UIImage* websiteImage = [websiteIcons objectAtIndex:indexPath.row];
	if ((NSNull*)websiteImage != [NSNull null])
	{
		cell.imageView.image = websiteImage;
	}
	return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
