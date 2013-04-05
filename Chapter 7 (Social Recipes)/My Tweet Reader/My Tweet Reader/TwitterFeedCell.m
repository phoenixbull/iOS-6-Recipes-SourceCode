//
//  TwitterFeedCell.m
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "TwitterFeedCell.h"

NSString * const TwitterFeedCellId = @"TwitterFeedCell";

@implementation TwitterFeedCell

- (void)setTwitterAccount:(ACAccount *)account
{
    _twitterAccount = account;
    if (_twitterAccount)
    {
        self.textLabel.text = _twitterAccount.accountDescription;
    }
    else
    {
        self.textLabel.text = @"Public";
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
