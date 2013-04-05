//
//  OurAppsTableViewController.m
//  About Us
//
//  Created by Hans-Eric Grönlund on 8/11/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "OurAppsTableViewController.h"
#import "AppDetailsViewController.h"
#import "AppDetails.h"
#import "AppTableViewCell.h"

@interface OurAppsTableViewController ()

@end

@implementation OurAppsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushAppDetails"])
    {
        AppDetailsViewController *appDetailsViewController = segue.destinationViewController;
        AppTableViewCell *cell = sender;
        appDetailsViewController.appDetails = [[AppDetails alloc] initWithName:cell.nameLabel.text description:cell.descriptionLabel.text];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Set the CellIdentifier that you set in the storyboard
    static NSString *CellIdentifier = @"AppCell";
    
    AppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    switch (indexPath.row)
    {
        case 0:
            cell.nameLabel.text = @"Awesome App";
            cell.descriptionLabel.text = @"Long description of the awesome app...";
            break;
        case 1:
            cell.nameLabel.text = @"Even More Awesome App";
            cell.descriptionLabel.text = @"Long description of the even more awesome app...";
            break;
        case 2:
            cell.nameLabel.text = @"The Most Awesome App Ever";
            cell.descriptionLabel.text = @"Long description of the most awesome app ever seen...";
            break;
                
        default:
            cell.nameLabel.text = @"Unkown";
            cell.descriptionLabel.text = @"Unknown";
            break;
    }
    
    return cell;
}


@end
