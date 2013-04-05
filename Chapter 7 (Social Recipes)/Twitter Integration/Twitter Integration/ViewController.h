//
//  ViewController.h
//  Twitter Integration
//
//  Created by Hans-Eric Grönlund on 8/16/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    @private
    NSArray *availableTwitterAccounts;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) ACAccountStore *accountStore;

- (IBAction)shareOnTwitter:(id)sender;

@end
