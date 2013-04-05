//
//  WordsViewController.h
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/5/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"
#import "Word.h"
#import "EditWordViewController.h"

@interface WordsViewController : UITableViewController

@property (strong, nonatomic)Vocabulary *vocabulary;

- (id)initWithVocabulary:(Vocabulary *)vocabulary;

@end
