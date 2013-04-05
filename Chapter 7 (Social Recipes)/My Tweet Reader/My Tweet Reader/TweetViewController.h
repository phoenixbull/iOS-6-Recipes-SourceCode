//
//  TweetViewController.h
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScreenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;

@property (strong, nonatomic) NSDictionary *tweetData;

-(id)initWithTweetData:(NSDictionary *)tweetData;

@end
