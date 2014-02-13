//
//  ViewController.m
//  Photos
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		
		if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
			picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
		else
			picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
		
		picker.delegate = self;
		
		[self presentViewController:picker animated:YES completion:nil];
	}
}

- (IBAction)loadFromLibrary:(id)sender
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	
	picker.delegate = self;
	[self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	self.imageView.image = image;
	
	[picker dismissViewControllerAnimated:YES completion:nil];
}

@end
