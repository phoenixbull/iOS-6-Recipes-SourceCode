//
//  TweetCell.h
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const TweetCellId;

@interface TweetCell : UITableViewCell

@property (strong, nonatomic)NSDictionary *tweetData;

@end
