//
//  GameViewController.h
//  Lucky
//
//  Created by Hans-Eric Grönlund on 9/17/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface GameViewController : UIViewController<UIAlertViewDelegate>
{
    @private
    int _score;
    int _level;
    NSMutableArray *_selectedButtons;
}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) NSMutableDictionary *achievements;

- (IBAction)gameButtonSelected:(UIButton *)sender;

- (id)initWithLevel:(int)level achievements:(NSMutableDictionary *)achievements;

@end
