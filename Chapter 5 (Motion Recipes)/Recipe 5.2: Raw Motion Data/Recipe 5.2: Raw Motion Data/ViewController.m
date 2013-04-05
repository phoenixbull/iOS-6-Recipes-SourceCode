//
//  ViewController.m
//  Recipe 5.2: Raw Motion Data
//
//  Created by Hans-Eric Grönlund on 6/16/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize xAccLabel;
@synthesize yAccLabel;
@synthesize zAccLabel;
@synthesize xGyroLabel;
@synthesize yGyroLabel;
@synthesize zGyroLabel;
@synthesize xMagLabel;
@synthesize yMagLabel;
@synthesize zMagLabel;
@synthesize motionManager = _motionManager;

-(CMMotionManager *)motionManager
{
    if (_motionManager == nil)
    {
        _motionManager = [[CMMotionManager alloc] init];
    }
    return _motionManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)startUpdates
{
    // Start accelerometer if available
    if ([self.motionManager isAccelerometerAvailable])
    {
        [self.motionManager setAccelerometerUpdateInterval:1.0/2.0]; //Update twice per second
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                                 withHandler:
         ^(CMAccelerometerData *data, NSError *error)
         {
             self.xAccLabel.text = [NSString stringWithFormat:@"%f", data.acceleration.x];
             self.yAccLabel.text = [NSString stringWithFormat:@"%f", data.acceleration.y];
             self.zAccLabel.text = [NSString stringWithFormat:@"%f", data.acceleration.z];
         }];
    }
    
    // Start gyroscope if available
    if ([self.motionManager isGyroAvailable])
    {
        [self.motionManager setGyroUpdateInterval:1.0/2.0]; //Update twice per second
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue]
                                        withHandler:
         ^(CMGyroData *data, NSError *error)
         {
             self.xGyroLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
             self.yGyroLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
             self.zGyroLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];
         }];
    }
    
    // Start magnetometer if available
    if ([self.motionManager isMagnetometerAvailable])
    {
        [self.motionManager setMagnetometerUpdateInterval:1.0/2.0]; //Update twice per second
        [self.motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                                withHandler:
         ^(CMMagnetometerData *data, NSError *error)
         {
             self.xMagLabel.text = [NSString stringWithFormat:@"%f", data.magneticField.x];
             self.yMagLabel.text = [NSString stringWithFormat:@"%f", data.magneticField.y];
             self.zMagLabel.text = [NSString stringWithFormat:@"%f", data.magneticField.z];
         }];
    }
}


-(void)stopUpdates
{
    if ([self.motionManager isAccelerometerAvailable] && [self.motionManager isAccelerometerActive])
    {
        [self.motionManager stopAccelerometerUpdates];
    }
    
    if ([self.motionManager isGyroAvailable] && [self.motionManager isGyroActive])
    {
        [self.motionManager stopGyroUpdates];
    }
    
    if ([self.motionManager isMagnetometerAvailable] && [self.motionManager isMagnetometerActive])
    {
        [self.motionManager stopMagnetometerUpdates];
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:(BOOL)animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
