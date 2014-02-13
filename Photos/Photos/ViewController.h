//
//  ViewController.h
//  Photos
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)loadFromLibrary:(id)sender;

@end
