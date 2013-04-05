//
//  CountryDetailsViewController.m
//  Countries
//
//  Created by Hans-Eric Grönlund on 7/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "CountryDetailsViewController.h"

@interface CountryDetailsViewController ()

@end

@implementation CountryDetailsViewController
@synthesize nameLabel;
@synthesize flagImageView;
@synthesize capitalTextField;
@synthesize mottoTextField;

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
    // Do any additional setup after loading the view from its nib.
    self.mottoTextField.delegate = self;
    self.capitalTextField.delegate = self;
    
    UIBarButtonItem *revertButton =
        [[UIBarButtonItem alloc] initWithTitle:@"Revert"
                                         style:UIBarButtonItemStyleBordered
                                        target:self
                                        action:@selector(revert)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:revertButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)populateViewWithCountry:(Country *)country
{
    self.currentCountry = country;
    
    self.flagImageView.image = country.flag;
    self.nameLabel.text = country.name;
    self.capitalTextField.text = country.capital;
    self.mottoTextField.text = country.motto;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self populateViewWithCountry:self.currentCountry];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)revert
{
    [self populateViewWithCountry:self.currentCountry];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.view.window endEditing: YES];
    
    self.currentCountry.capital = self.capitalTextField.text;
    self.currentCountry.motto = self.mottoTextField.text;
    [self.delegate countryDetailsViewControllerDidFinish:self];
}


@end
