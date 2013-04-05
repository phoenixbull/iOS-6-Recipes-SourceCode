//
//  MasterViewController.h
//  Image Recipes
//
//  Created by Hans-Eric Grönlund on 8/21/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) UIImage *mainImage;
@property (strong, nonatomic) NSMutableArray *filteredImages;

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;
+ (UIImage *)aspectScaleImage:(UIImage *)image toSize:(CGSize)size;
+ (UIImage *)aspectFillImage:(UIImage *)image toSize:(CGSize)size;

@end
