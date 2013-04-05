//
//  MyLogActivity.m
//  Sharing Text
//
//  Created by Hans-Eric Grönlund on 8/16/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "MyLogActivity.h"

@implementation MyLogActivity

-(NSString *)activityType
{
    return @"MyLogActivity";
}

-(NSString *)activityTitle
{
    return @"Log";
}

-(UIImage *)activityImage
{
    return [UIImage imageNamed:@"log_icon.png"];
}

-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (NSObject *item in activityItems)
    {
        if (![item isKindOfClass:[NSString class]] && ![item isKindOfClass:[NSURL class]])
        {
            return NO;
        }
    }
    return YES;
}

-(void)prepareWithActivityItems:(NSArray *)activityItems
{
    self.logMessage = @"";
    for (NSObject *item in activityItems) {
        self.logMessage = [NSString stringWithFormat:@"%@\n%@", self.logMessage, item];
    }
}

-(void)performActivity
{
    NSLog(@"%@", self.logMessage);
    [self activityDidFinish:YES];
}

@end
