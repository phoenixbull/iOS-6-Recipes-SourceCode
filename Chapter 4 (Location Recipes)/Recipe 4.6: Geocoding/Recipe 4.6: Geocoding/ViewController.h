//
//  ViewController.h
//  Recipe 4.6: Geocoding
//
//  Created by Hans-Eric Grönlund on 6/26/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    CLGeocoder *_geocoder;
}

@property (strong, nonatomic) IBOutlet UILabel *geocodingResultsLabel;
@property (strong, nonatomic) IBOutlet UIButton *reverseGeocodingButton;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;

- (IBAction)findCurrentAddress:(id)sender;
- (IBAction)findCoordinateOfAddress:(id)sender;

@end
