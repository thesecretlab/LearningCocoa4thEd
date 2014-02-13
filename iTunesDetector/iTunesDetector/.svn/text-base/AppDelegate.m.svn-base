//
//  AppDelegate.m
//  iTunesDetector
//
//  Created by Jon Manning on 1/04/12.
//  Copyright (c) 2012 Secret Lab. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSNetServiceBrowserDelegate, NSNetServiceDelegate> {
    NSNetServiceBrowser* browser;
    NSMutableArray* services;
}

@end

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    services = [NSMutableArray array];
    
    browser = [[NSNetServiceBrowser alloc] init];
    
    browser.delegate = self;
    [browser searchForServicesOfType:@"_daap._tcp" inDomain:nil];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing {
    
    [services addObject:aNetService];
    
        aNetService.delegate = self;
    [aNetService resolveWithTimeout:5];

    NSLog(@"Found a service: %@", aNetService);
    
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing {
    
    [services removeObject:aNetService];
    NSLog(@"A service was removed: %@", aNetService);
    
}

- (void)netServiceDidResolveAddress:(NSNetService *)sender {
    NSURL* serviceURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%i", sender.hostName, sender.port]];
    
    NSLog(@"Resolved address for service %@: %@", sender, serviceURL);
        
}

-(void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict {
    NSLog(@"Couldn't resolve address for service %@: %@", sender, errorDict);
}

@end
