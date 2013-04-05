//
//  ViewController.h
//  Recipe 2.2: Coding Autolayout
//
//  Created by Hans-Eric Grönlund on 8/5/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UIButton *addButton;
@property (strong, nonatomic) UIButton *removeButton;
@property (strong, nonatomic) UIButton *clearButton;
@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) NSMutableArray *imageViewConstraints;


@end
