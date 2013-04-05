//
//  ViewController.m
//  Recipe 6.5: Adding Overlays
//
//  Created by Hans-Eric Grönlund on 7/4/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    
    // Circle overlay
    CLLocationCoordinate2D mexicoCityLocation = CLLocationCoordinate2DMake(19.808, -98.965);
    MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:mexicoCityLocation radius:500000];
    
    // Polygon overlay
    CLLocationCoordinate2D polyCoords[5] = {
        CLLocationCoordinate2DMake(39.9, -76.6),
        CLLocationCoordinate2DMake(36.7, -84.0),
        CLLocationCoordinate2DMake(33.1, -89.4),
        CLLocationCoordinate2DMake(27.3, -80.8),
        CLLocationCoordinate2DMake(39.9, -76.6)
    };
    MKPolygon *polygonOverlay = [MKPolygon polygonWithCoordinates:polyCoords count:5];
    
    // Polyline overlay
    CLLocationCoordinate2D pathCoords[2] = {
        CLLocationCoordinate2DMake(46.8, -100.8),
        CLLocationCoordinate2DMake(43.7, -70.4)
    };
    MKPolyline *pathOverlay = [MKPolyline polylineWithCoordinates:pathCoords count:2];
    
    // Add the overlays to the map
    [self.mapView addOverlays:[NSArray arrayWithObjects: circleOverlay, polygonOverlay, pathOverlay, nil]];
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

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id )overlay
{
    if([overlay isKindOfClass:[MKCircle class]])
    {
        MKCircleView *view = [[MKCircleView alloc] initWithOverlay:overlay];
        
        //Display settings
        view.lineWidth = 1;
        view.strokeColor = [UIColor blueColor];
        view.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        return view;
    }
    if([overlay isKindOfClass:[MKPolygon class]])
    {
        MKPolygonView *view = [[MKPolygonView alloc] initWithOverlay:overlay];
        
        //Display settings
        view.lineWidth=1;
        view.strokeColor=[UIColor blueColor];
        view.fillColor=[[UIColor blueColor] colorWithAlphaComponent:0.5];
        return view;
    }
    else if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineView *view = [[MKPolylineView alloc] initWithOverlay:overlay];
        
        //Display settings
        view.lineWidth = 3;
        view.strokeColor = [UIColor blueColor];
        return view;
    }
    
    return nil;
}

@end
