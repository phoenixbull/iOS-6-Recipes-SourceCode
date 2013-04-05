//
//  ViewController.h
//  Recipe 4.4: Determining True Bearing
//
//  Created by Hans-Eric Grönlund on 6/25/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@property (strong, nonatomic) IBOutlet UILabel *headingInformationLabel;
@property (strong, nonatomic) IBOutlet UILabel *trueHeadingInformationLabel;
@property (strong, nonatomic) IBOutlet UISwitch *headingUpdatesSwitch;

- (IBAction)toggleHeadingUpdates:(id)sender;

@end
