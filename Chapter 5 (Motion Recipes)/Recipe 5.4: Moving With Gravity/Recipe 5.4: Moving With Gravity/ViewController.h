//
//  ViewController.h
//  Recipe 5.4: Moving With Gravity
//
//  Created by Hans-Eric Grönlund on 6/18/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

- (void)startUpdates;
- (void)stopUpdates;

@end
