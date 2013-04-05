//
//  ViewController.h
//  Recipe 6.6: Grouping Annotations Dynamically
//
//  Created by Hans-Eric Grönlund on 7/5/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>
{
    CLLocationDegrees _zoomLevel;
    NSMutableArray *_annotations;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
