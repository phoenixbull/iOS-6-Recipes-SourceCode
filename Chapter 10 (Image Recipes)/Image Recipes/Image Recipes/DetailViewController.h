//
//  DetailViewController.h
//  Image Recipes
//
//  Created by Hans-Eric Grönlund on 8/21/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *selectImageButton;
@property (weak, nonatomic) IBOutlet UIButton *clearImageButton;

@property (strong, nonatomic) UIPopoverController *pop;
@property (strong, nonatomic) MasterViewController *masterViewController;

- (IBAction)selectImage:(id)sender;
- (IBAction)clearImage:(id)sender;
- (void)configureDetailsWithImage:(UIImage *)image label:(NSString *)label showsButtons:(BOOL)showButton;

@end
