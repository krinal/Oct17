//
//  View.m
//  Oct17
//
//  Created by Krinal Manakiwala on 10/17/13.
//  Copyright (c) 2013 Computerlab. All rights reserved.
//

#import "View.h"


@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
       
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{

    
    NSLog(@"self.frame == (%g, %g), %g × %g",
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    
	NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
	// Drawing code
	CGRect bounds = self.bounds;
	CGFloat radius = .3 * bounds.size.width;	//in pixels
    
	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  bounds.origin.x and bounds.origin.y are the coordinates of
	 the upper left corner of the View.
     */
	CGRect r = CGRectMake(
                          -radius,
                          -radius,
                          2 * radius,
                          2 * radius
                          );
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);	//unnecessary here: the path is already empty.
    CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);
	CGContextFillPath(c);
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 2.0];
}

@end