//
//  AppTableViewCell.m
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "AppTableViewCell.h"

@implementation AppTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
