//
//  ViewController.h
//  Recipe 4.2: Significant Location Change
//
//  Created by Hans-Eric Grönlund on 6/24/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@property (strong, nonatomic) IBOutlet UILabel *locationInformationLabel;
@property (strong, nonatomic) IBOutlet UISwitch *locationUpdatesSwitch;

- (IBAction)toggleLocationUpdates:(id)sender;
@end
