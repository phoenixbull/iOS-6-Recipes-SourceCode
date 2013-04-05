//
//  ViewController.m
//  Twitter Integration
//
//  Created by Hans-Eric Grönlund on 8/16/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // User Canceled
        return;
    }
    
    NSInteger indexInAvailableTwitterAccountsArray = buttonIndex - 1;
    [self sendText:self.textView.text toTwitterAccount:[availableTwitterAccounts objectAtIndex:indexInAvailableTwitterAccountsArray]];
}

- (void)sendText:(NSString *)text toTwitterAccount:(ACAccount *)twitterAccount
{
    NSURL *requestURL = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/update.json"];
    SLRequest *tweetRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:requestURL parameters:[NSDictionary dictionaryWithObject:text forKey:@"status"]];
    
    [tweetRequest setAccount:twitterAccount];
    
    [tweetRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
     {
         __block NSString *status;
         
         if ([urlResponse statusCode] == 200)
         {
             status = [NSString stringWithFormat:@"Tweeted successfully to %@", twitterAccount.accountDescription];
         }
         else
         {
             status = @"Error occurred!";
             NSLog(@"%@", error);
         }
         
         dispatch_async(dispatch_get_main_queue(), ^(void) {
             self.statusLabel.text = status;
         });
         
     }];
}

- (IBAction)shareOnTwitter:(id)sender
{
    self.accountStore = [[ACAccountStore alloc] init];
    
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [self.accountStore requestAccessToAccountsWithType:accountType options:nil
                                            completion:^(BOOL granted, NSError *error)
     {
         __block NSString *statusText = @"";
         
         if (granted)
         {
             availableTwitterAccounts = [self.accountStore accountsWithAccountType:accountType];
             
             if (availableTwitterAccounts.count == 0)
             {
                 statusText = @"No Twitter accounts available";
             }
             if (availableTwitterAccounts.count == 1)
             {
                 ACAccount *account = [availableTwitterAccounts objectAtIndex:0];
                 [self sendText:self.textView.text toTwitterAccount:account];
             }
             else if (availableTwitterAccounts.count > 1)
             {
                 dispatch_async(dispatch_get_main_queue(), ^(void)
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Twitter Account"
                                                                     message:@"Select the Twitter account you want to use."
                                                                    delegate:self
                                                           cancelButtonTitle:@"Cancel"
                                                           otherButtonTitles:nil];
                     for (ACAccount *twitterAccount in availableTwitterAccounts)
                     {
                         [alert addButtonWithTitle:twitterAccount.accountDescription];
                     }
                     [alert show];
                 });
                 
             }
             
         }
         else
         {
             statusText = @"Access to Twitter accounts was not granted";
         }
         
         dispatch_async(dispatch_get_main_queue(), ^(void)
         {
             self.statusLabel.text = statusText;
         });

     }];
}
@end
