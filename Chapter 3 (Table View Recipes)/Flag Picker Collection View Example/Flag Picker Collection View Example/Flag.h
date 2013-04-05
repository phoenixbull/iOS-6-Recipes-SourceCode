//
//  Flag.h
//  Flag Picker Collection View Example
//
//  Created by Hans-Eric Grönlund on 8/14/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)UIImage *image;

- (id)initWithName:(NSString *)name imageName:(NSString *)imageName;
+ (Flag *)flagWithName:(NSString *)name imageName:(NSString *)imageName;

@end
