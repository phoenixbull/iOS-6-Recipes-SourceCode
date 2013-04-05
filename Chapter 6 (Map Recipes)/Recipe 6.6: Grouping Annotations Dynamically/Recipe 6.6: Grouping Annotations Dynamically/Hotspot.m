//
//  Hotspot.m
//  Recipe 6.6: Grouping Annotations Dynamically
//
//  Created by Hans-Eric Grönlund on 7/6/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "Hotspot.h"

@implementation Hotspot

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle
{
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.places = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(NSString *)title
{
    if ([self placesCount] == 1)
    {
        return _title;
    }
    else
        return [NSString stringWithFormat:@"%i Places", [self.places count]];
}

-(CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}

-(void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    _coordinate = coordinate;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
}

-(void)setSubtitle:(NSString *)subtitle
{
    _subtitle = subtitle;
}

-(void)addPlace:(Hotspot *)hotspot
{
    [self.places addObject:hotspot];
}

-(int)placesCount
{
    return [self.places count];
}

-(void)cleanPlaces
{
    [self.places removeAllObjects];
    [self.places addObject:self];
}

@end
