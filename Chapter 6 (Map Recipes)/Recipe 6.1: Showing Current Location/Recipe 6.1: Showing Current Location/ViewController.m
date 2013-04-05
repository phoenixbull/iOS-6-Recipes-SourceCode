//
//  ViewController.m
//  Recipe 6.1: Showing Current Location
//
//  Created by Hans-Eric Grönlund on 6/30/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;
@synthesize userLocationLabel;
@synthesize mapToolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    // Set initial region
    CLLocationCoordinate2D baltimoreLocation = CLLocationCoordinate2DMake(39.303, -76.612);
    self.mapView.region = MKCoordinateRegionMakeWithDistance(baltimoreLocation, 10000, 10000);
    
    // Optional Controls
    //    self.mapView.zoomEnabled = NO;
    //    self.mapView.scrollEnabled = NO;
    
    // Control User Location on Map
    if ([CLLocationManager locationServicesEnabled])
    {
        self.mapView.showsUserLocation = YES;
        [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    
    // Add button for controlling user location tracking
    MKUserTrackingBarButtonItem *trackingButton =
        [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    [self.mapToolbar setItems: [NSArray arrayWithObject: trackingButton] animated:YES];
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

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.userLocationLabel.text = [NSString stringWithFormat:@"%.5f°, %.5f°",
                                   userLocation.coordinate.latitude, userLocation.coordinate.longitude];
}

@end
