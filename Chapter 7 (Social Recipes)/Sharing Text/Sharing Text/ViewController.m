//
//  ViewController.m
//  Sharing Text
//
//  Created by Hans-Eric Grönlund on 8/15/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"
#import "MyLogActivity.h"

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

- (IBAction)shareContent:(id)sender
{
    NSString *text = self.messageTextView.text;
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    NSArray *items = @[text, url];
    MyLogActivity *myLogService = [[MyLogActivity alloc] init];
    NSArray *customServices = @[myLogService];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:items
                                                                     applicationActivities:customServices];
    vc.excludedActivityTypes = @[UIActivityTypeMail, UIActivityTypeCopyToPasteboard];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)shareOnFacebook:(id)sender
{
    NSString *text = self.messageTextView.text;
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];

    SLComposeViewController *cv = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [cv setInitialText:text];
    [cv addURL:url];
    
    [self presentViewController:cv animated:YES completion:nil];
}

@end
