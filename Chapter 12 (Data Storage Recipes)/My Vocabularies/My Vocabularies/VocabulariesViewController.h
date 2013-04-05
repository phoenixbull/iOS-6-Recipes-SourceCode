//
//  VocabulariesViewController.h
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/4/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"
#import "WordsViewController.h"

@interface VocabulariesViewController : UITableViewController<UIAlertViewDelegate>

@property (strong, nonatomic)NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)context;

@end
