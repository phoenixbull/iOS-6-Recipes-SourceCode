//
//  CountryCell.h
//  Countries
//
//  Created by Hans-Eric Grönlund on 7/12/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface CountryCell : UITableViewCell

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;

@property (strong, nonatomic) Country *country;

@end
