//
//  ViewController.h
//  Recipe 6.7: Starting Maps
//
//  Created by Hans-Eric Grönlund on 7/6/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

- (IBAction)startWithOnePlacemark:(id)sender;
- (IBAction)startWithMultiplePlacemarks:(id)sender;
- (IBAction)startInDirectionsMode:(id)sender;

@end
