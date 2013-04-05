//
//  ViewController.m
//  Recipe 1.11: Exception Handling Recipe
//
//  Created by Hans-Eric Grönlund on 8/31/12.
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

- (IBAction)throwFakeException:(id)sender
{
    NSException *e = [[NSException alloc] initWithName:@"FakeException" reason:@"The developer sucks!" userInfo:[NSDictionary dictionaryWithObject:@"Extra info" forKey:@"Key"]];
    [e raise];
}
@end
