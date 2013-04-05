//
//  TweetCell.m
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

NSString * const TweetCellId = @"TweetCell";

-(void)setTweetData:(NSDictionary *)tweetData
{
    _tweetData = tweetData;
    [self updateCell];
}

-(void)updateCell
{
    NSDictionary *userData = [self.tweetData objectForKey:@"user"];
    self.textLabel.text = [userData objectForKey:@"name"];
    self.detailTextLabel.text = [self.tweetData objectForKey:@"text"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self)
    {
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
