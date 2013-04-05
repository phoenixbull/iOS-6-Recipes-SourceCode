//
//  TwitterFeedCell.h
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

extern NSString * const TwitterFeedCellId;

@interface TwitterFeedCell : UITableViewCell

@property (strong, nonatomic)ACAccount *twitterAccount;

@end
