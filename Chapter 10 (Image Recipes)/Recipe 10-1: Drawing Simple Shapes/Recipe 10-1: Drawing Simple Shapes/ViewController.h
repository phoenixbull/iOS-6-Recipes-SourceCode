//
//  ViewController.h
//  Recipe 10-1: Drawing Simple Shapes
//
//  Created by Hans-Eric Grönlund on 8/20/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MyView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MyView *myView;

@end
