//
//  ViewController.m
//  Recipe 1-10: Default Error Handling
//
//  Created by Hans-Eric Grönlund on 8/31/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)attemptRecoveryFromError:(NSError *)error optionIndex:(NSUInteger)recoveryOptionIndex {
    return NO;
}

- (IBAction)fakeNonFatalError:(id)sender
{
    NSString *description = @"Connection Error";
    NSString *failureReason = @"Can't seem to get a connection.";
    NSArray *recoveryOptions = @[@"Retry"];
    NSString *recoverySuggestion = @"Check your wifi settings and retry.";
    
    NSDictionary *userInfo =
        [NSDictionary dictionaryWithObjects:@[description, failureReason, recoveryOptions, recoverySuggestion, self]
        forKeys: @[NSLocalizedDescriptionKey,NSLocalizedFailureReasonErrorKey, NSLocalizedRecoveryOptionsErrorKey, NSLocalizedRecoverySuggestionErrorKey, NSRecoveryAttempterErrorKey]];
    
    NSError *error = [[NSError alloc] initWithDomain:@"com.hans-eric.ios6recipesbook"
                                                code:42 userInfo:userInfo];
    
    [ErrorHandler handleError:error fatal:NO];
}

- (IBAction)fakeFatalError:(id)sender
{
    NSString *description = @"Data Error";
    NSString *failureReason = @"Data is corrupt. The app must shut down.";
    NSString *recoverySuggestion = @"Contact support!";

    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:@[description, failureReason, recoverySuggestion] forKeys:@[NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, NSLocalizedRecoverySuggestionErrorKey]];
    
    NSError *error = [[NSError alloc] initWithDomain:@"com.hans-eric.ios6recipesbook"
                                                code:22 userInfo:userInfo];
    
    [ErrorHandler handleError:error fatal:YES];
}
@end
