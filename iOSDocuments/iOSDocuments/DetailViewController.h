//
//  DetailViewController.h
//  iOSDocuments
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
