//
//  ViewController.h
//  Creating Contacts
//
//  Created by Hans-Eric Grönlund on 8/30/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController<ABNewPersonViewControllerDelegate>

- (IBAction)addNewContact:(id)sender;

@end
