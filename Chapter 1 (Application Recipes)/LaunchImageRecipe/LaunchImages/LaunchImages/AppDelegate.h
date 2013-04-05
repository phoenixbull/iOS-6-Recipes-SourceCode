//
//  AppDelegate.h
//  LaunchImages
//
//  Created by Hans-Eric Grönlund on 2012-05-18.
//  Copyright (c) 2012 Know IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
