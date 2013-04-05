//
//  ViewController.h
//  Remind Me
//
//  Created by Hans-Eric Grönlund on 8/28/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^RestrictedEventStoreActionHandler)();
typedef void(^RetrieveCurrentLocationHandler)(CLLocation *);

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    @private
    CLLocationManager *_locationManager;
    RetrieveCurrentLocationHandler _retrieveCurrentLocationBlock;
    int _numberOfTries;
}

@property (weak, nonatomic) IBOutlet UIButton *addTimeBasedReminderButton;
@property (weak, nonatomic) IBOutlet UIButton *addLocationBasedReminderButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic)EKEventStore *eventStore;

- (IBAction)addTimeBasedReminder:(id)sender;
- (IBAction)addLocationBasedReminder:(id)sender;

- (void)handleReminderAction:(RestrictedEventStoreActionHandler)block;
- (void)retrieveCurrentLocation:(RetrieveCurrentLocationHandler)block;

@end
