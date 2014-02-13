//
//  ViewController.m
//  MultipeerChat
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "ViewController.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ViewController ()

@property (strong) MCBrowserViewController *browser;
@property (strong) MCAdvertiserAssistant *assistant;
@property (strong) MCSession *session;
@property (strong) MCPeerID *peerID;
	
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// configure the peerID and session
	_peerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice]name]];
	_session = [[MCSession alloc] initWithPeer:_peerID];
	_session.delegate = self;
	
	// create the browser viewcontroller with a unique service name
	_browser = [[MCBrowserViewController alloc] initWithServiceType:@"LCOC-Chat" session:_session];
	_browser.delegate = self;
	_assistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"LCOC-Chat" discoveryInfo:nil session:_session];
	// tell the assistant to start advertising our fabulous chat
	[_assistant start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showBrowser:(id)sender
{
	[self presentViewController:_browser animated:YES completion:nil];
}
- (IBAction)sendChat:(id)sender
{
	NSData *msg = [_msgField.text dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error;
	[_session sendData:msg toPeers:[_session connectedPeers] withMode:MCSessionSendDataUnreliable error:&error];
	[self updateChat:_msgField.text fromPeer:_peerID.displayName];
	[_msgField resignFirstResponder];
}
- (void)updateChat:(NSString *)msg fromPeer:(NSString *)peerName
{
	NSString *message = [NSString stringWithFormat:@"%@:%@\n",peerName,msg];
	_chatView.text = [_chatView.text stringByAppendingString:message];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
	NSLog(@"received data");
	dispatch_async(dispatch_get_main_queue(), ^{
		NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		[self updateChat:msg fromPeer:peerID.displayName];
	});
}
-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{}
-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{}
-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{}
-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{}
	
@end
