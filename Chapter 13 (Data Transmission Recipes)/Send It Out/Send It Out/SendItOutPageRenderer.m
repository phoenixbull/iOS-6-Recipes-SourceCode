//
//  SendItOutPageRenderer.m
//  Send It Out
//
//  Created by Hans-Eric Grönlund on 9/10/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "SendItOutPageRenderer.h"

@implementation SendItOutPageRenderer

- (void)drawHeaderForPageAtIndex:(NSInteger)pageIndex  inRect:(CGRect)headerRect
{
    if (pageIndex != 0)
    {
        UIFont *font = [UIFont fontWithName:@"Helvetica"size:12.0];
        CGSize titleSize = [self.title sizeWithFont:font];
        
        CGFloat drawXTitle = CGRectGetMaxX(headerRect) - titleSize.width;
        CGFloat drawXAuthor = CGRectGetMinX(headerRect);
        CGFloat drawY = CGRectGetMinY(headerRect);
        CGPoint drawPointAuthor = CGPointMake(drawXAuthor, drawY);
        CGPoint drawPointTitle = CGPointMake(drawXTitle, drawY);
        
        [self.title drawAtPoint:drawPointTitle withFont:font];
        [self.author drawAtPoint:drawPointAuthor withFont:font];
    }
}

- (void)drawFooterForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)footerRect
{
    UIFont *font = [UIFont fontWithName:@"Helvetica"size:12.0];
    NSString *pageNumber = [NSString stringWithFormat:@"%d.", pageIndex+1];
    
    CGSize pageNumSize = [pageNumber sizeWithFont:font];
    CGFloat drawX = CGRectGetMaxX(footerRect)/2.0 - pageNumSize.width - 1.0;
    CGFloat drawY = CGRectGetMaxY(footerRect) - pageNumSize.height;
    CGPoint drawPoint = CGPointMake(drawX, drawY);
    [pageNumber drawAtPoint:drawPoint withFont:font];
}

-(void)drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex
{
    CGRect contentRect = CGRectMake(self.printableRect.origin.x, self.printableRect.origin.y+self.headerHeight, self.printableRect.size.width, self.printableRect.size.height-self.headerHeight-self.footerHeight);
    [printFormatter drawInRect:contentRect forPageAtIndex:pageIndex];
    
    NSString *overlayText = @"Overlay Text";
    UIFont *font = [UIFont fontWithName:@"Helvetica"size:26.0];
    CGSize overlaySize = [overlayText sizeWithFont:font];
    
    CGFloat xCenter = CGRectGetMaxX(self.printableRect)/2.0 - overlaySize.width/2.0;
    CGFloat yCenter = CGRectGetMaxY(self.printableRect)/2.0 - overlaySize.height/2.0;
    CGPoint overlayPoint = CGPointMake(xCenter, yCenter);
    
    [overlayText drawAtPoint:overlayPoint withFont:font];
}

@end
