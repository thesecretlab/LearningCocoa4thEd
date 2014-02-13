//
//  ViewController.h
//  MultipeerChat
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ViewController : UIViewController<MCBrowserViewControllerDelegate,MCSessionDelegate>
	
@property (weak, nonatomic) IBOutlet UITextView *chatView;
@property (weak, nonatomic) IBOutlet UITextField *msgField;

@end
