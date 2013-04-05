//
//  ViewController.m
//  Recipe 4.5: Welcome to Baltimore
//
//  Created by Hans-Eric Grönlund on 6/26/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize regionInformationLabel;
@synthesize regionMonitoringSwitch;

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

- (IBAction)toggleRegionMonitoring:(id)sender
{
    if (regionMonitoringSwitch.on == YES)
    {
        //Check if region monitoring is available
        if([CLLocationManager regionMonitoringAvailable])
        {
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            
            if (status == kCLAuthorizationStatusAuthorized ||
                status == kCLAuthorizationStatusNotDetermined)
            {
                if(_locationManager == nil)
                {
                    _locationManager = [[CLLocationManager alloc] init];
                    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
                    // For backward compatibility, set the deprecated purpose property
                    // to the same as NSLocationUsageDescription in the Info.plist
                    _locationManager.purpose = [[NSBundle mainBundle]
                                                objectForInfoDictionaryKey:@"NSLocationUsageDescription"];
                    _locationManager.delegate = self;
                }
                
                CLLocationCoordinate2D baltimoreCoordinate = CLLocationCoordinate2DMake(39.2963, -76.613);
                int regionRadius = 3000; // meters
                if (regionRadius > _locationManager.maximumRegionMonitoringDistance)
                {
                    regionRadius = _locationManager.maximumRegionMonitoringDistance;
                }
                CLRegion *baltimoreRegion = [[CLRegion alloc] initCircularRegionWithCenter:baltimoreCoordinate
                                                                                  radius:regionRadius 
                                                                              identifier:@"baltimoreRegion"];
                [_locationManager startMonitoringForRegion: baltimoreRegion];
            }
            else
            {
                self.regionInformationLabel.text = @"Region monitoring disabled";
                regionMonitoringSwitch.on = NO;
            }
            
        }
        else
        {
            self.regionInformationLabel.text = @"Region monitoring not available";
            regionMonitoringSwitch.on = NO;
        }
    }
    else
    {
        if (_locationManager!=nil)
        {
            for (CLRegion *monitoredRegion in [_locationManager monitoredRegions])
            {
                [_locationManager stopMonitoringForRegion:monitoredRegion];
                self.regionInformationLabel.text =
                [NSString stringWithFormat:@"Turned off region monitoring for: %@", monitoredRegion.identifier];
            }
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region
             withError:(NSError *)error
{
    switch (error.code) {
        case kCLErrorRegionMonitoringDenied:
        {
            self.regionInformationLabel.text = @"Region monitoring is denied on this device";
            break;
        }   
        case kCLErrorRegionMonitoringFailure:
        {
            self.regionInformationLabel.text = [NSString stringWithFormat:@"Region monitoring failed for region: %@", region.identifier];
            break;
        }
        default:
        {
            self.regionInformationLabel.text = [NSString stringWithFormat:@"An unhandled error occured: %@", error.description];
            break;
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    self.regionInformationLabel.text = @"Welcome to Baltimore!";
    
    UILocalNotification *entranceNotification = [[UILocalNotification alloc] init];
    entranceNotification.alertBody = @"Welcome to Baltimore!";
    entranceNotification.alertAction = @"Ok";
    entranceNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow: entranceNotification];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    self.regionInformationLabel.text = @"Thanks for visiting Baltimore! Come back soon!";
    
    UILocalNotification *exitNotification = [[UILocalNotification alloc] init];
    exitNotification.alertBody = @"Thanks for visiting Baltimore! Come back soon!";
    exitNotification.alertAction = @"Ok";
    exitNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow: exitNotification];
}

@end
