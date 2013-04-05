//
//  ViewController.h
//  Recipe 6.4: Draggable Pin Tool
//
//  Created by Hans-Eric Grönlund on 7/4/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
