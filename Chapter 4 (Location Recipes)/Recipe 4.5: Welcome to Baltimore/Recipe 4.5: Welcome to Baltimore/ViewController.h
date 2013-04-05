//
//  ViewController.h
//  Recipe 4.5: Welcome to Baltimore
//
//  Created by Hans-Eric Grönlund on 6/26/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@property (strong, nonatomic) IBOutlet UILabel *regionInformationLabel;
@property (strong, nonatomic) IBOutlet UISwitch *regionMonitoringSwitch;

- (IBAction)toggleRegionMonitoring:(id)sender;

@end
