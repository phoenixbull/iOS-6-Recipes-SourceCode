//
//  ContinentHeader.m
//  Flag Picker Collection View Example
//
//  Created by Hans-Eric Grönlund on 8/14/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ContinentHeader.h"

@implementation ContinentHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.textColor = [UIColor whiteColor];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *viewsDictionary =
        [[NSDictionary alloc] initWithObjectsAndKeys:
         self.label, @"label", nil];
        [self addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:nil views:viewsDictionary]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
