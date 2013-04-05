//
//  ViewController.h
//  Recipe 5.3: Device Motion Data
//
//  Created by Hans-Eric Grönlund on 6/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *rollLabel;
@property (strong, nonatomic) IBOutlet UILabel *pitchLabel;
@property (strong, nonatomic) IBOutlet UILabel *yawLabel;
@property (strong, nonatomic) IBOutlet UILabel *xRotLabel;
@property (strong, nonatomic) IBOutlet UILabel *yRotLabel;
@property (strong, nonatomic) IBOutlet UILabel *zRotLabel;
@property (strong, nonatomic) IBOutlet UILabel *xGravLabel;
@property (strong, nonatomic) IBOutlet UILabel *yGravLabel;
@property (strong, nonatomic) IBOutlet UILabel *zGravLabel;
@property (strong, nonatomic) IBOutlet UILabel *xAccLabel;
@property (strong, nonatomic) IBOutlet UILabel *yAccLabel;
@property (strong, nonatomic) IBOutlet UILabel *zAccLabel;
@property (strong, nonatomic) IBOutlet UILabel *xMagLabel;
@property (strong, nonatomic) IBOutlet UILabel *yMagLabel;
@property (strong, nonatomic) IBOutlet UILabel *zMagLabel;

@property (nonatomic, strong) CMMotionManager *motionManager;

- (void)startUpdates;
- (void)stopUpdates;

@end
