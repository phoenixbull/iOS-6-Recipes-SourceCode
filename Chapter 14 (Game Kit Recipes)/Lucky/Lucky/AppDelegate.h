//
//  AppDelegate.h
//  Lucky
//
//  Created by Hans-Eric Grönlund on 9/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
