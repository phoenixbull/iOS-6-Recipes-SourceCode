//
//  RecentTweetsTableViewController.h
//  My Tweet Reader
//
//  Created by Hans-Eric Grönlund on 8/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface RecentTweetsTableViewController : UITableViewController

@property (strong, nonatomic) ACAccount *twitterAccount;
@property (strong, nonatomic) NSMutableArray *tweets;

-(id)initWithTwitterAccount:(ACAccount *)account;

@end
