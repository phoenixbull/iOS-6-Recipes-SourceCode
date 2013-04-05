//
//  ViewController.h
//  Recipe 1-10: Default Error Handling
//
//  Created by Hans-Eric Grönlund on 8/31/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorHandler.h"

@interface ViewController : UIViewController

- (IBAction)fakeNonFatalError:(id)sender;
- (IBAction)fakeFatalError:(id)sender;

@end
