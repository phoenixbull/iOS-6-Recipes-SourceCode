//
//  CountryCell.m
//  Countries
//
//  Created by Hans-Eric Grönlund on 7/12/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "CountryCell.h"

@implementation CountryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        self.textLabel.font = [UIFont systemFontOfSize:19.0];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)setCountry:(Country *)country
{
    if (country != _country)
    {
        _country = country;
        self.textLabel.text = _country.name;
        self.detailTextLabel.text = _country.capital;
        self.imageView.image =
            [CountryCell scale: _country.flag toSize:CGSizeMake(115, 75)];
    }
}

@end
