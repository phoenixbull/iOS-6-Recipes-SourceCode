//
//  GameViewController.m
//  Lucky
//
//  Created by Hans-Eric Grönlund on 9/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLevel:(int)level achievements:(NSMutableDictionary *)achievements
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        _level = level;
        _score = 0;
        _selectedButtons = [[NSMutableArray alloc] initWithCapacity:4];
        self.achievements = achievements;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    switch (_level)
    {
        case 0:
            self.title = @"Easy Game";
            break;
        case 1:
            self.title = @"Normal Game";
            break;
        case 2:
            self.title = @"Hard Game";
            break;
            
        default:
            break;
    }
    
    [self updateScoreLabel];
    [self setupButtons];
}

- (void)setupButtons
{
    switch (_level) {
        case 0:
            [self setupButtonsForEasyGame];
            break;
        case 1:
            [self setupButtonsForNormalGame];
            break;
        case 2:
            [self setupButtonsForHardGame];
            break;
        default:
            break;
    }
}

- (void)setupButtonsForEasyGame
{
    [self resetButtonTags];
    int killerButtonIndex = rand() % 4;
    [self buttonForIndex:killerButtonIndex].tag = 1;
}

- (void)setupButtonsForNormalGame
{
    [self resetButtonTags];
    int killerButtonIndex1 = rand() % 4;
    int killerButtonIndex2;
    do {
        killerButtonIndex2 = rand() % 4;
    } while (killerButtonIndex1 == killerButtonIndex2);
    
    [self buttonForIndex:killerButtonIndex1].tag = 1;
    [self buttonForIndex:killerButtonIndex2].tag = 1;
}

- (void)setupButtonsForHardGame
{
    int safeButtonIndex = rand() % 4;
    for (int i=0; i < 4; i++) {
        if (i == safeButtonIndex) {
            [self buttonForIndex:i].tag = 0;
        }
        else
        {
            [self buttonForIndex:i].tag = 1;
        }
    }
}

- (void)resetButtonTags
{
    for (int i = 0; i < 4; i++)
    {
        UIButton *button = [self buttonForIndex:i];
        button.tag = 0;
    }
}

- (UIButton *)buttonForIndex:(int)index
{
    switch (index)
    {
        case 0:
            return self.button1;
        case 1:
            return self.button2;
        case 2:
            return self.button3;
        case 3:
            return self.button4;
        default:
            return nil;
    }
}

- (void)updateScoreLabel
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", _score];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gameButtonSelected:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        // Safe, continue game
        _score += 1;
        [self updateScoreLabel];
        [self setupButtons];
        if (![_selectedButtons containsObject:sender])
        {
            [_selectedButtons addObject:sender];
            if (_selectedButtons.count == 4)
            {
                [self reportAllFourButtonsAchievementCompleted];
            }
        }
    }
    else
    {
        // Game Over
        NSString *message = [NSString stringWithFormat:@"Your score was %i.", _score];
        UIAlertView *gameOverAlert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [gameOverAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
    if ([GKLocalPlayer localPlayer].isAuthenticated)
    {
        [self reportScore:_score forLeaderboard:[self leaderboardID]];
    }
}

- (NSString *)leaderboardID
{
    switch (_level) {
        case 0:
            return @"Lucky.easy";
        case 1:
            return @"Lucky.medium";
        case 2:
            return @"Lucky.hard";
        default:
            return @"";
    }
}

- (NSString *)achievementID
{
    switch (_level) {
        case 0:
            return @"AllFourButtons.easy";
        case 1:
            return @"AllFourButtons.normal";
        case 2:
            return @"AllFourButtons.hard";
        default:
            return @"";
    }
}

- (void)reportScore:(int64_t)score forLeaderboard: (NSString*)leaderboardID
{
    GKScore *gameCenterScore = [[GKScore alloc] initWithCategory:leaderboardID];
    gameCenterScore.value = score;
    gameCenterScore.context = 0;
    
    [gameCenterScore reportScoreWithCompletionHandler:^(NSError *error)
     {
         if (error)
         {
             NSLog(@"Error reporting score: %@", error);
         }
     }];
}

- (void)reportAllFourButtonsAchievementCompleted
{
    GKAchievement *achievement = [self getAchievement];
    if (achievement != nil && !achievement.completed)
    {
        achievement.percentComplete = 100;
        achievement.showsCompletionBanner = NO;
        [achievement reportAchievementWithCompletionHandler:^(NSError *error)
         {
             if (error != nil)
             {
                 NSLog(@"Error when reporting achievement: %@", error);
             }
             else
             {
                 [GKNotificationBanner showBannerWithTitle:@"Achievement Completed" message:@"You have used all four buttons and earned 100 points!" completionHandler:nil];
             }
         }];
    }
}

- (GKAchievement *)getAchievement
{
    NSString *achievementID = [self achievementID];
    GKAchievement *achievement = [self.achievements objectForKey:achievementID];
    if (achievement == nil)
    {
        achievement = [[GKAchievement alloc] initWithIdentifier:achievementID];
        [self.achievements setObject:achievement forKey:achievement.identifier];
    }
    return achievement;
}

@end
