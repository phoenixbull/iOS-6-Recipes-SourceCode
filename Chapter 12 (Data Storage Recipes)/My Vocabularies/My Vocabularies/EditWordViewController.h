//
//  EditWordViewController.h
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/5/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@class EditWordViewController;

typedef void (^EditWordViewControllerCompletionHandler)(EditWordViewController *sender, BOOL canceled);

@interface EditWordViewController : UIViewController
{
@private
    EditWordViewControllerCompletionHandler _completionHandler;
    Word *_word;
}

@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UITextField *translationTextField;

- (id)initWithWord:(Word *)word completion:(EditWordViewControllerCompletionHandler)completionHandler;

+ (void)editWord:(Word *)word inNavigationController:(UINavigationController *)navigationController completion:(EditWordViewControllerCompletionHandler)completionHandler;

@end