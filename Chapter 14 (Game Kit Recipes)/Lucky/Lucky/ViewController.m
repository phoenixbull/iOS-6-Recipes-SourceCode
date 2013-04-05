//
//  ViewController.m
//  Lucky
//
//  Created by Hans-Eric Grönlund on 9/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.achievements = [[NSMutableDictionary alloc] init];
    self.title = @"Lucky";
    self.player = nil;
    [self authenticatePlayer];
}

- (void)authenticatePlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    localPlayer.authenticateHandler = ^(UIViewController *authenticateViewController, NSError *error)
    {
        if (authenticateViewController != nil)
        {
            [self presentViewController:authenticateViewController animated:YES completion:nil];
        }
        else if (localPlayer.isAuthenticated)
        {
            self.player = localPlayer;
        }
        else
        {
            // Disable Game Center
            self.player = nil;
        }
    };
}

- (void)setPlayer:(GKLocalPlayer *)player
{
    if (_player == player)
        return;
    [self.achievements removeAllObjects];
    
    _player = player;
    
    NSString *playerName;
    if (_player)
    {
        playerName = _player.alias;
        [self loadAchievements];
    }
    else
    {
        playerName = @"Anonymous Player";
    }
    self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome %@", playerName];
}

- (void)loadAchievements
{
    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray *achievements, NSError *error)
     {
         if (error == nil)
         {
             for (GKAchievement* achievement in achievements)
                 [self.achievements setObject: achievement forKey: achievement.identifier];
         }
         else
         {
             NSLog(@"Error loading achievements: %@", error);
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playEasyGame:(id)sender
{
    [self playGameWithLevel:0];
}

- (IBAction)playNormalGame:(id)sender
{
    [self playGameWithLevel:1];
}

- (IBAction)playHardGame:(id)sender
{
    [self playGameWithLevel:2];
}

- (IBAction)showGameCenter:(id)sender
{
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        [self presentViewController:gameCenterController animated:YES completion:nil];
    }
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playGameWithLevel:(int)level
{
    GameViewController *gameViewController = [[GameViewController alloc] initWithLevel:level achievements:self.achievements];
    [self.navigationController pushViewController:gameViewController animated:YES];
}

@end
