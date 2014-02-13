//
//  ViewController.m
//  MemoryDemo
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

#define MEMORY_FIX 0

@implementation ViewController
@synthesize imagesContainer;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (UIImage*) imageWithNumber:(NSInteger)number {
    
    CGRect imageRect = self.imagesContainer.frame;
    
    UIGraphicsBeginImageContext(imageRect.size);
    
    // Inset the image by 30px so that we can see the rounded corners    
    imageRect = CGRectInset(imageRect, 30, 30);
    
    // Draw a rounded rectangle
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:10];
    
    [path setLineWidth:20];
    [[UIColor blackColor] setStroke];
    [[UIColor scrollViewTexturedBackgroundColor] setFill];
    
    [path fill];
    [path stroke];
    
    // Draw the number
    NSString* label = [NSString stringWithFormat:@"%i", number];
    
    UIFont* font = [UIFont systemFontOfSize:50];
    CGPoint labelPoint = CGPointMake(50, 50);
    
    [[UIColor whiteColor] setFill];
    [label drawAtPoint:labelPoint withFont:font];
   
    // Get the finished image and return it
    UIImage* returnedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return returnedImage;    
}

- (void) loadPageWithNumber:(NSInteger) number {
    
    // If an image view already exists for this page, don't do anything
    if ([self.imagesContainer viewWithTag:number])
        return;
    
    // Get the image for this page
    UIImage* image = [self imageWithNumber:number];
    
    // Create and prepare the image view for this page
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    CGRect imageViewFrame = [self.imagesContainer bounds];
    imageViewFrame.origin.x = imageViewFrame.size.width * (number - 1);
    imageView.frame = imageViewFrame;
    
    // Add it to the scroll view
    [self.imagesContainer addSubview:imageView];
    
    // Mark this new image view with a tag so that we can easily refer to it later
    imageView.tag = number;    
}

- (void) updatePages {
    int pageNumber = imagesContainer.contentOffset.x / imagesContainer.bounds.size.width + 1;
    
    // Load the image previous to this one
    [self loadPageWithNumber:pageNumber - 1];
    // Load the current page
    [self loadPageWithNumber:pageNumber];
    // Load the next page
    [self loadPageWithNumber:pageNumber+1];
    
    // Remove all image views that aren't on this page or the pages adjacent to it
    for (UIImageView* imageView in imagesContainer.subviews) {
        if (imageView.tag < pageNumber - 1 || imageView.tag > pageNumber + 1)
            [imageView removeFromSuperview];
    }
}

 

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
#if MEMORY_FIX
    [self updatePages];
#endif
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSInteger pageCount = 1000;
    
#if MEMORY_FIX
    [self updatePages];
#else
    for (int i = 1; i < pageCount; i++) {
        [self loadPageWithNumber:i];
    }
#endif 
    
    CGSize contentSize;
    contentSize.height = self.imagesContainer.bounds.size.height;
    contentSize.width = self.imagesContainer.bounds.size.width * pageCount;
    
    
    self.imagesContainer.contentSize = contentSize;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImagesContainer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
