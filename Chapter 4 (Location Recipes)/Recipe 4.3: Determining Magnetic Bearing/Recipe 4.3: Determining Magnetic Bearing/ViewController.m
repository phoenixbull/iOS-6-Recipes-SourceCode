//
//  ViewController.m
//  Recipe 4.3: Determining Magnetic Bearing
//
//  Created by Hans-Eric Grönlund on 6/25/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize headingInformationLabel;
@synthesize headingUpdatesSwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)toggleHeadingUpdates:(id)sender
{
    if (self.headingUpdatesSwitch.on == YES)
    {
        // Heading data is not available on all devices
        if ([CLLocationManager headingAvailable] == NO)
        {
            self.headingInformationLabel.text = @"Heading services unavailable";
            self.headingUpdatesSwitch.on = NO;
            return;
        }
        
        if (_locationManager == nil)
        {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.headingFilter = 5; // degrees
            _locationManager.delegate = self;
            
            // For backward compatibility, set the deprecated purpose property
            // to the same as NSLocationUsageDescription in the Info.plist
            _locationManager.purpose = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationUsageDescription"];
        }
        [_locationManager startUpdatingHeading];
        self.headingInformationLabel.text = @"Starting heading tracking...";
    }
    else
    {
        // Switch was turned Off
        self.headingInformationLabel.text = @"Stopped heading tracking";
        // Stop updates if they have been started
        if (_locationManager != nil)
        {
            [_locationManager stopUpdatingHeading];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSTimeInterval headingInterval = [newHeading.timestamp timeIntervalSinceNow];
    if(abs(headingInterval)<30)
    {
        if(newHeading.headingAccuracy < 0)
            return;
        
        self.headingInformationLabel.text = [NSString stringWithFormat:@"%.1f°", newHeading.magneticHeading];
    }
}

-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return YES;
}

@end
