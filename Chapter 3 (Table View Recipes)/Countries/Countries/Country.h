//
//  Country.h
//  Countries
//
//  Created by Hans-Eric Grönlund on 7/10/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) UIImage *flag;

@end
