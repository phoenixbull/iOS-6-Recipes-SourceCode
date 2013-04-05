//
//  AppDetailsViewController.m
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "AppDetailsViewController.h"

@interface AppDetailsViewController ()

@end

@implementation AppDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.nameLabel.text = self.appDetails.name;
    self.descriptionTextView.text = self.appDetails.description;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
