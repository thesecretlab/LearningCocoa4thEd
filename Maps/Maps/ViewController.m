//
//  ViewController.m
//  Maps
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

	_mapView.delegate = self;
	// centering the map over Melbourne.
	_mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(-37.813611, 144.963056), MKCoordinateSpanMake(2, 2));
	
	// creating a new annotation
	MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
	annotation.coordinate = CLLocationCoordinate2DMake(-37.813611, 144.963056);
	annotation.title = @"Melbourne";
	annotation.subtitle = @"How exciting!";
	// adding the annotation to the map
	[_mapView addAnnotation:annotation];
	
	// creating a new overlay
	MKCircle *overlay = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(-37.813611, 144.963056) radius:50000];
	// adding the overlay to the map
	[_mapView addOverlay:overlay];
}
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
	if ([overlay isKindOfClass:[MKCircle class]])
	{
		MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
		
		renderer.strokeColor = [UIColor greenColor];
		renderer.fillColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5];
		
		return renderer;
	}
	return nil;
}
	
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
