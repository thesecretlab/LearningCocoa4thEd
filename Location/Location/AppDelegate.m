//
//  AppDelegate.m
//  Location
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()
{
	CLLocationManager *_locationManager;
	CLGeocoder *_geocoder;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	_locationManager = [[CLLocationManager alloc] init];
	_locationManager.delegate = self;
	[_locationManager startUpdatingLocation];
	_geocoder = [[CLGeocoder alloc] init];
	
	CLLocationCoordinate2D location;
	location.latitude = -42.880556;
	location.longitude = 147.325;
	
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:location radius:1000 identifier:@"Hobart"];
	[_locationManager startMonitoringForRegion:region];
}
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
	// do something
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
	// collecting the most recent location from the array of locations
	CLLocation *newLocation = [locations lastObject];
	self.latitudeLabel.stringValue = [NSString stringWithFormat:@"%.2f",newLocation.coordinate.latitude];
	self.longitudeLabel.stringValue = [NSString stringWithFormat:@"%.2f",newLocation.coordinate.longitude];
	self.accuracyLabel.stringValue = [NSString stringWithFormat:@"%.1fm",newLocation.horizontalAccuracy];
	
	[self.spinner stopAnimation:nil];
	
	[_geocoder reverseGeocodeLocation:newLocation
					completionHandler:^(NSArray *placemarks, NSError *error) {
						if (error != nil)
						{
							self.addressLabel.stringValue = @"Can't find this address!";
							return;
						}
						CLPlacemark *placeMark = [placemarks lastObject];
						NSString *addressString = [NSString stringWithFormat:@"%@ %@, %@, %@ %@",placeMark.subThoroughfare,placeMark.thoroughfare,placeMark.locality,placeMark.administrativeArea,placeMark.country];
						self.addressLabel.stringValue = addressString;
					}];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	self.latitudeLabel.stringValue = @"-";
	self.longitudeLabel.stringValue = @"-";
	self.accuracyLabel.stringValue = @"-";
	
	[self.spinner startAnimation:nil];
}

@end
