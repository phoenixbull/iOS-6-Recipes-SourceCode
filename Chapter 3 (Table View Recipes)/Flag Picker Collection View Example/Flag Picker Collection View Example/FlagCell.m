//
//  FlagCell.m
//  Flag Picker Collection View Example
//
//  Created by Hans-Eric Grönlund on 8/14/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "FlagCell.h"

@implementation FlagCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 56, 100, 19)];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:self.nameLabel];
        self.flagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, 88, 49)];
        [self.contentView addSubview:self.flagImageView];
        
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:frame];
        self.selectedBackgroundView.backgroundColor = [UIColor grayColor];
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
