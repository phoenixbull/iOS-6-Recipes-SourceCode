//
//  FirstViewController.h
//  Retrieving Tweets
//
//  Created by Hans-Eric Grönlund on 8/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *publicLabel;
@property (weak, nonatomic) IBOutlet UITextView *publicTextView;

@end
