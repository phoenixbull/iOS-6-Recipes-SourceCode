//
//  WordsViewController.m
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/5/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "WordsViewController.h"

@interface WordsViewController ()

@end

@implementation WordsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithVocabulary:(Vocabulary *)vocabulary
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        self.vocabulary = vocabulary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = addButton;

    self.title = self.vocabulary.name;
}

- (void)add
{
    NSEntityDescription *wordEntityDescription = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.vocabulary.managedObjectContext];
    Word *newWord = (Word *)[[NSManagedObject alloc] initWithEntity:wordEntityDescription insertIntoManagedObjectContext:self.vocabulary.managedObjectContext];
    [EditWordViewController editWord:newWord inNavigationController:self.navigationController completion:
     ^(EditWordViewController *sender, BOOL canceled)
     {
         if (canceled)
         {
             [self.vocabulary.managedObjectContext deleteObject:newWord];
         }
         else
         {
             [self.vocabulary addWordsObject:newWord];
             
             NSError *error;
             if (![self.vocabulary.managedObjectContext save:&error])
             {
                 NSLog(@"Error saving context: %@", error);
             }
             [self.tableView reloadData];
         }
         
         [self.navigationController popViewControllerAnimated:YES];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vocabulary.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WordCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Word *word = [self.vocabulary.words.allObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = word.word;
    cell.detailTextLabel.text = word.translation;
    
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Word *word = [self.vocabulary.words.allObjects objectAtIndex:indexPath.row];
    [EditWordViewController editWord:word inNavigationController:self.navigationController completion:
     ^(EditWordViewController *sender, BOOL canceled)
     {
         NSError *error;
         if (![self.vocabulary.managedObjectContext save:&error])
         {
             NSLog(@"Error saving context: %@", error);
         }
         
         [self.tableView reloadData];
         [self.navigationController popViewControllerAnimated:YES];
     }];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Word *deleted = [self.vocabulary.words.allObjects objectAtIndex:indexPath.row];
        [self.vocabulary.managedObjectContext deleteObject:deleted];
        NSError *error;
        BOOL success = [self.vocabulary.managedObjectContext save:&error];
        if (!success)
        {
            NSLog(@"Error saving context: %@", error);
        }
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}


@end
