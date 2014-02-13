//
//  CustomView.m
//  CustomViews
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

// Change this to a number from 0 to 6 to see the different views.
#define VERSION 6

- (void)drawRect:(NSRect)dirtyRect
{
#if VERSION == 0
    NSBezierPath* path = [NSBezierPath bezierPathWithRect:self.bounds];
	
    [[NSColor greenColor] setFill];
    [path fill];
#elif VERSION == 1
    
    NSRect pathRect = NSInsetRect(self.bounds, 1, 1);
    
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:pathRect xRadius:10 yRadius:10];
    [[NSColor greenColor] setFill];
    [[NSColor blackColor] setStroke];
    [path fill];
    [path stroke];
    
#elif VERSION == 2
    
    NSBezierPath* bezierPath = [NSBezierPath bezierPath];
    [bezierPath moveToPoint: NSMakePoint(145.97, 241.04)];
    [bezierPath curveToPoint: NSMakePoint(248.61, 293.5) controlPoint1: NSMakePoint(145.97, 241.04) controlPoint2: NSMakePoint(155.7, 293.64)];
    [bezierPath curveToPoint: NSMakePoint(145.97, 11.51) controlPoint1: NSMakePoint(341.51, 293.36) controlPoint2: NSMakePoint(257.52, 13.23)];
    [bezierPath curveToPoint: NSMakePoint(47.48, 290.78) controlPoint1: NSMakePoint(34.42, 9.78) controlPoint2: NSMakePoint(-46.75, 290.73)];
    [bezierPath curveToPoint: NSMakePoint(145.97, 241.04) controlPoint1: NSMakePoint(141.72, 290.83) controlPoint2: NSMakePoint(145.97, 241.04)];
    [bezierPath closePath];
    [[NSColor redColor] setFill];
    [bezierPath fill];
    
    [[NSColor blackColor] setStroke];
    [bezierPath stroke];
	
#elif VERSION == 3
    
    //// Bezier Drawing
    NSBezierPath* bezierPath = [NSBezierPath bezierPath];
    
    // Draw the star.
    
    [bezierPath moveToPoint: NSMakePoint(42.5, 77.5)];
    [bezierPath lineToPoint: NSMakePoint(30.51, 60)];
    [bezierPath lineToPoint: NSMakePoint(10.16, 54.01)];
    [bezierPath lineToPoint: NSMakePoint(23.1, 37.2)];
    [bezierPath lineToPoint: NSMakePoint(22.52, 15.99)];
    [bezierPath lineToPoint: NSMakePoint(42.5, 23.1)];
    [bezierPath lineToPoint: NSMakePoint(62.48, 15.99)];
    [bezierPath lineToPoint: NSMakePoint(61.9, 37.2)];
    [bezierPath lineToPoint: NSMakePoint(74.84, 54.01)];
    [bezierPath lineToPoint: NSMakePoint(54, 60)];
    [bezierPath lineToPoint: NSMakePoint(42.5, 77.5)];
    [bezierPath closePath];
    
    // Draw the circle outside it.
    
    [bezierPath moveToPoint: NSMakePoint(70.64, 71.64)];
    [bezierPath curveToPoint: NSMakePoint(70.64, 14.36) controlPoint1: NSMakePoint(86.45, 55.82) controlPoint2: NSMakePoint(86.45, 30.18)];
    [bezierPath curveToPoint: NSMakePoint(13.36, 14.36) controlPoint1: NSMakePoint(54.82, -1.45) controlPoint2: NSMakePoint(29.18, -1.45)];
    [bezierPath curveToPoint: NSMakePoint(13.36, 71.64) controlPoint1: NSMakePoint(-2.45, 30.18) controlPoint2: NSMakePoint(-2.45, 55.82)];
    [bezierPath curveToPoint: NSMakePoint(70.64, 71.64) controlPoint1: NSMakePoint(29.18, 87.45) controlPoint2: NSMakePoint(54.82, 87.45)];
    [bezierPath closePath];
    
    // Fill the path.
    [[NSColor darkGrayColor] setFill];
    [bezierPath fill];
    
#elif VERSION == 4
    
    // Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: [NSColor blackColor]];
    [shadow setShadowOffset: NSMakeSize(3, -3)];
    [shadow setShadowBlurRadius: 5];
    
    // Rectangle Drawing
    
    NSRect pathRect = NSInsetRect(self.bounds, 20, 20);
    
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: pathRect];
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [[NSColor darkGrayColor] setFill];
    [rectanglePath fill];
    [NSGraphicsContext restoreGraphicsState];
    
#elif VERSION == 5
    
    // Color Declarations
    NSColor* gradientStartColor = [NSColor colorWithCalibratedRed: 0.06 green: 0.23 blue: 0.7 alpha: 1];
    NSColor* gradientEndColor = [NSColor colorWithCalibratedRed: 0.28 green: 0.41 blue: 0.81 alpha: 1];
    
    // Gradient Declarations
    NSGradient* gradient = [[NSGradient alloc] initWithStartingColor: gradientStartColor endingColor: gradientEndColor];
    
    // Rounded Rectangle Drawing
    
    NSRect pathRect = NSInsetRect(self.bounds, 20, 20);
	
    NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: pathRect xRadius: 4 yRadius: 4];
    [gradient drawInBezierPath: roundedRectanglePath angle: 90];
    
#elif VERSION == 6
    
    NSRect pathRect = NSInsetRect(self.bounds, 125, 125);
    
    // Create a transform that rotates the drawing by a small amount around the origin.
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(M_PI / 8.0);
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:pathRect xRadius:10 yRadius:10];
    
    // Save the context before we start drawing
    [NSGraphicsContext saveGraphicsState];
    
    // Rotate
    CGContextConcatCTM(context, rotationTransform);
    
    [[NSColor greenColor] setFill];
    [[NSColor blackColor] setStroke];
    [path fill];
    [path stroke];
    
    // Restore the context.
    [NSGraphicsContext restoreGraphicsState];
	
#endif
}

@end
