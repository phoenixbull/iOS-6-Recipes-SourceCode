//
//  ViewController.h
//  Tic Tac Toe
//
//  Created by Hans-Eric Grönlund on 9/21/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface ViewController : UIViewController<GKTurnBasedMatchmakerViewControllerDelegate, GKTurnBasedEventHandlerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *row1Col1Button;
@property (weak, nonatomic) IBOutlet UIButton *row1Col2Button;
@property (weak, nonatomic) IBOutlet UIButton *row1Col3Button;
@property (weak, nonatomic) IBOutlet UIButton *row2Col1Button;
@property (weak, nonatomic) IBOutlet UIButton *row2Col2Button;
@property (weak, nonatomic) IBOutlet UIButton *row2Col3Button;
@property (weak, nonatomic) IBOutlet UIButton *row3Col1Button;
@property (weak, nonatomic) IBOutlet UIButton *row3Col2Button;
@property (weak, nonatomic) IBOutlet UIButton *row3Col3Button;
@property (weak, nonatomic) IBOutlet UILabel *player1Label;
@property (weak, nonatomic) IBOutlet UILabel *player2Label;

@property (strong, nonatomic) GKLocalPlayer *localPlayer;
@property (strong, nonatomic) GKTurnBasedMatch *match;
@property (strong, nonatomic) GKPlayer *player1;
@property (strong, nonatomic) GKPlayer *player2;

- (IBAction)selectButton:(UIButton *)sender;

@end
