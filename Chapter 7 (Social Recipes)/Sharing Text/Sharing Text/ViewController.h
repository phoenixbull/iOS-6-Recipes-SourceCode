//
//  ViewController.h
//  Sharing Test
//
//  Created by Hans-Eric Grönlund on 8/15/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

- (IBAction)shareContent:(id)sender;
- (IBAction)shareOnFacebook:(id)sender;

@end
