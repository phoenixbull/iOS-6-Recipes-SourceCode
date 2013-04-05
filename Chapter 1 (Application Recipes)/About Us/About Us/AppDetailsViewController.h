//
//  AppDetailsViewController.h
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDetails.h"

@interface AppDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) AppDetails *appDetails;

@end
