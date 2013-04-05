//
//  Flag.m
//  Flag Picker Collection View Example
//
//  Created by Hans-Eric Grönlund on 8/14/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (id)initWithName:(NSString *)name imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.name = name;
        NSString *imageFile = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        self.image = [[UIImage alloc] initWithContentsOfFile:imageFile];
    }
    return self;
}

+ (Flag *)flagWithName:(NSString *)name imageName:(NSString *)imageName
{
    return [[Flag alloc] initWithName:name imageName:imageName];
}



@end
