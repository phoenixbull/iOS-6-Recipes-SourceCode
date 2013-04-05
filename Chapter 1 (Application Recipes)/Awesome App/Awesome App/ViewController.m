//
//  ViewController.m
//  Awesome App
//
//  Created by Hans-Eric Grönlund on 8/12/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"
#import "AboutUsViewController.h"

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

- (IBAction)showAboutUsView:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AboutUs" bundle:nil];
    AboutUsViewController *vc = [storyboard instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
