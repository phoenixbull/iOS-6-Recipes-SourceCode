//
//  ViewController.m
//  Recipe 4.1: Basic Location Information
//
//  Created by Hans-Eric Grönlund on 6/21/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationInformationLabel;
@synthesize locationUpdatesSwitch;

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

- (IBAction)toggleLocationUpdates:(id)sender
{
    if (self.locationUpdatesSwitch.on == YES)
    {
        if ([CLLocationManager locationServicesEnabled] == NO)
        {
            UIAlertView *locationServicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"This feature requires location services. Enable it in the privacy settings on your device" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [locationServicesDisabledAlert show];
            self.locationUpdatesSwitch.on = NO;
            return;
        }
        
        if (_locationManager == nil)
        {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            _locationManager.distanceFilter = 1; // meter
            _locationManager.activityType = CLActivityTypeOther;
            _locationManager.delegate = self;

            // For backward compatibility, set the deprecated purpose property
            // to the same as NSLocationUsageDescription in the Info.plist
            _locationManager.purpose = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationUsageDescription"];
        }
        [_locationManager startUpdatingLocation];
    }
    else
    {
        // Switch was turned Off
        // Stop updates if they have been started
        if (_locationManager != nil)
        {
            [_locationManager stopUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied)
    {
        // Turning the switch to off will trigger the toggleLocationServices action,
        // which in turn will stop further updates from coming
        self.locationUpdatesSwitch.on = NO;
    }
    else
    {
        NSLog(@"%@", error);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // Make sure this is a recent location event
    CLLocation *lastLocation = [locations lastObject];
    NSTimeInterval eventInterval = [lastLocation.timestamp timeIntervalSinceNow];
    if(abs(eventInterval) < 30.0)
    {
        // Make sure the event is accurate enough
        if (lastLocation.horizontalAccuracy >= 0 && lastLocation.horizontalAccuracy < 20)
        {
            self.locationInformationLabel.text = lastLocation.description;
        }
        else
        {
            self.locationInformationLabel.text = [NSString stringWithFormat:@"Accuracy not good enough: %f", lastLocation.horizontalAccuracy];
        }
    }
    else
    {
        self.locationInformationLabel.text = [NSString stringWithFormat:@"Event not recent enough: %@",
                                              lastLocation.timestamp];
    }
}

@end
