//
//  FlagPickerViewController.h
//  Flag Picker Collection View Example
//
//  Created by Hans-Eric Grönlund on 8/14/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flag.h"

@class FlagPickerViewController;

@protocol FlagPickerViewControllerDelegate <NSObject>

-(void)flagPicker:(FlagPickerViewController *)flagPicker didPickFlag:(Flag *)flag;

@end

@interface FlagPickerViewController : UICollectionViewController
{
@private
    NSArray *africanFlags;
    NSArray *asianFlags;
    NSArray *australasianFlags;
    NSArray *europeanFlags;
    NSArray *northAmericanFlags;
    NSArray *southAmericanFlags;
}

- (id)initWithDelegate:(id<FlagPickerViewControllerDelegate>)delegate;

@property (weak, nonatomic)id<FlagPickerViewControllerDelegate>delegate;

@end
