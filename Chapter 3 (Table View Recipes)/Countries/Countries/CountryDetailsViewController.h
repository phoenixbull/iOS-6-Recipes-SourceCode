//
//  CountryDetailsViewController.h
//  Countries
//
//  Created by Hans-Eric Grönlund on 7/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@class CountryDetailsViewController;

@protocol CountryDetailsViewControllerDelegate <NSObject>
-(void)countryDetailsViewControllerDidFinish:(CountryDetailsViewController *)sender;
@end

@interface CountryDetailsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UITextField *capitalTextField;
@property (weak, nonatomic) IBOutlet UITextField *mottoTextField;

@property (strong, nonatomic) Country *currentCountry;
@property (strong, nonatomic) id <CountryDetailsViewControllerDelegate> delegate;

@end
