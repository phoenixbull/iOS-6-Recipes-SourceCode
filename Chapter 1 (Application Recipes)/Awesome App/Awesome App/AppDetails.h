//
//  AppDetails.h
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDetails : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *description;

-(id)initWithName:(NSString *)name description:(NSString *)descr;

@end
