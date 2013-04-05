//
//  AppDetails.m
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "AppDetails.h"

@implementation AppDetails

-(id)initWithName:(NSString *)name description:(NSString *)descr
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.description = descr;
    }
    return self;
}

@end
