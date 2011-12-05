//
//  PFIGradientButton.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIGradientButton.h"

@implementation PFIGradientButton

@synthesize  colorEnd;
@synthesize  colorStart;

-(id)initWithFrame:(CGRect)frame startColor:(UIColor*) start endColor:(UIColor*) end
{
	self = [super initWithFrame:frame];
	if (self) 
    {
        self.colorStart = start;
        self.colorEnd = end; 
	}
	return self;
}
-(void) drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    CGColorRef start = self.colorStart.CGColor;
    CGColorRef end   = self.colorEnd.CGColor;
    
    NSArray *colors = [NSArray arrayWithObjects:(id)start, (id)end, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colors, locations);
    
    // More coming... 
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, self.bounds);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    //CGContextRestoreGState(context);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    ///fill white color at the corner
    CGPoint A = CGPointMake(25, 25);
    CGPoint B = CGPointMake(18, 25);
    CGPoint C = CGPointMake(25, 18);
    
    CGContextMoveToPoint(context, A.x, A.y);
    CGContextAddLineToPoint(context, B.x, B.y);
    CGContextAddLineToPoint(context, C.x, C.y);
    CGContextAddLineToPoint(context, A.x, A.y);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
     

}
@end



