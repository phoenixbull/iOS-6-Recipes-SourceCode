//
//  ViewController.m
//  Recipe 5.1: Shake Events
//
//  Created by Hans-Eric Grönlund on 6/14/12.
//  Copyright (c) 2012 Know IT. All rights reserved.
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewWillAppear: (BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakeDetected:) name:@"NOTIFICATION_SHAKE" object:nil];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear: (BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewWillDisappear:animated];
}

-(void)shakeDetected:(NSNotification *)paramNotification
{
    NSLog(@"Shaken not stirred!");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
