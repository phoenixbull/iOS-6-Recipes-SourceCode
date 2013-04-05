//
//  MyView.m
//  Recipe 10-1: Drawing Simple Shapes
//
//  Created by Hans-Eric Grönlund on 8/20/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Draw rectangle
    CGRect drawingRect = CGRectMake(0.0, 20.0f, 100.0f, 180.0f);
    const CGFloat *rectColorComponents = CGColorGetComponents([[UIColor greenColor] CGColor]);
    CGContextSetFillColor(context, rectColorComponents);
    CGContextFillRect(context, drawingRect);
    // Draw ellipse
    CGRect ellipseRect = CGRectMake(140.0f, 200.0f, 75.0f, 50.0f);
    const CGFloat *ellipseColorComponenets = CGColorGetComponents([[UIColor blueColor] CGColor]);
    CGContextSetFillColor(context, ellipseColorComponenets);
    CGContextFillEllipseInRect(context, ellipseRect);
    // Draw parallelogram
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, 100.0f, 0.0f);
    CGContextAddLineToPoint(context, 140.0f, 100.0f);
    CGContextAddLineToPoint(context, 40.0f, 100.0f);
    CGContextClosePath(context);
    CGContextSetGrayFillColor(context, 0.4f, 0.85f);
    CGContextSetGrayStrokeColor(context, 0.0, 0.0);
    CGContextFillPath(context);
    
    if (self.image)
    {
        CGFloat imageWidth = self.frame.size.width / 2;
        CGFloat imageHeight = self.frame.size.height / 2;
        CGRect imageRect = CGRectMake(imageWidth, imageHeight, imageWidth, imageHeight);
        [self.image drawInRect:imageRect];
    }
}

@end
