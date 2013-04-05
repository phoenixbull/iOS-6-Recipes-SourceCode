//
//  DetailedViewController.h
//  Recipe 6.3: Customizing Annotations
//
//  Created by Hans-Eric Grönlund on 7/3/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"

@interface DetailedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactInfoLabel;

@property (strong, nonatomic) MyAnnotation *annotation;

-(id)initWithAnnotation:(MyAnnotation *)annotation;

@end
