//
//  ViewController.m
//  Tic Tac Toe
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithTitle:@"Play"
                                                                   style:UIBarButtonItemStyleBordered target:self action:@selector(playGame:)];
    self.navigationItem.rightBarButtonItem = playButton;
    [self enableSquareButtons:NO];
    self.title = @"Tic Tac Toe";
    self.statusLabel.text = @"Press Play to start a game";
}

- (void)playGame:(id)sender
{
    _currentMark = @"X";
    self.statusLabel.text = [NSString stringWithFormat:@"X's turn"];
    [self resetButtonTitles];
    [self enableSquareButtons:YES];
}

- (void)resetButtonTitles
{
    [self.row1Col1Button setTitle:@"" forState:UIControlStateNormal];
    [self.row1Col2Button setTitle:@"" forState:UIControlStateNormal];
    [self.row1Col3Button setTitle:@"" forState:UIControlStateNormal];
    [self.row2Col1Button setTitle:@"" forState:UIControlStateNormal];
    [self.row2Col2Button setTitle:@"" forState:UIControlStateNormal];
    [self.row2Col3Button setTitle:@"" forState:UIControlStateNormal];
    [self.row3Col1Button setTitle:@"" forState:UIControlStateNormal];
    [self.row3Col2Button setTitle:@"" forState:UIControlStateNormal];
    [self.row3Col3Button setTitle:@"" forState:UIControlStateNormal];
}

- (void)enableSquareButtons:(BOOL)enable
{
    self.row1Col1Button.enabled = enable;
    self.row1Col2Button.enabled = enable;
    self.row1Col3Button.enabled = enable;
    self.row2Col1Button.enabled = enable;
    self.row2Col2Button.enabled = enable;
    self.row2Col3Button.enabled = enable;
    self.row3Col1Button.enabled = enable;
    self.row3Col2Button.enabled = enable;
    self.row3Col3Button.enabled = enable;
}

- (IBAction)selectButton:(UIButton *)sender
{
    if (sender.currentTitle.length != 0)
    {
        UIAlertView *squareOccupiedAlert = [[UIAlertView alloc]
                                            initWithTitle:@"Invalid Move" message:@"You can only pick empty squares"
                                            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [squareOccupiedAlert show];
        return;
    }
    
    [sender setTitle:_currentMark forState:UIControlStateNormal];
    [self checkCurrentState];
}

- (void)checkCurrentState
{
    if ([self equalMarksForButton1:self.row1Col1Button button2:self.row1Col2Button
                           button3:self.row1Col3Button])
    {
        [self gameEndedWithWinner:self.row1Col1Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row2Col1Button button2:self.row2Col2Button
                                button3:self.row2Col3Button])
    {
        [self gameEndedWithWinner:self.row2Col1Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row3Col1Button button2:self.row3Col2Button
                                button3:self.row3Col3Button])
    {
        [self gameEndedWithWinner:self.row3Col1Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row1Col1Button button2:self.row2Col1Button
                                button3:self.row3Col1Button])
    {
        [self gameEndedWithWinner:self.row1Col1Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row1Col2Button button2:self.row2Col2Button
                                button3:self.row3Col2Button])
    {
        [self gameEndedWithWinner:self.row1Col2Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row1Col3Button button2:self.row2Col3Button
                                button3:self.row3Col3Button])
    {
        [self gameEndedWithWinner:self.row1Col3Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row1Col1Button button2:self.row2Col2Button
                                button3:self.row3Col3Button])
    {
        [self gameEndedWithWinner:self.row1Col1Button.currentTitle];
    }
    else if ([self equalMarksForButton1:self.row1Col3Button button2:self.row2Col2Button
                                button3:self.row3Col1Button])
    {
        [self gameEndedWithWinner:self.row1Col3Button.currentTitle];
    }
    else if ([self noEmptySquaresLeft])
    {
        [self gameEndedInTie];
    }
    else
    {
        [self advanceTurn];
    }
}

- (BOOL)equalMarksForButton1:(UIButton *)button1 button2:(UIButton *)button2 button3:(UIButton *)button3
{
    return button1.currentTitle.length > 0 &&
    [button1.currentTitle isEqualToString:button2.currentTitle] &&
    [button1.currentTitle isEqualToString:button3.currentTitle];
}

- (void)gameEndedWithWinner:(NSString *)mark
{
    NSString *message = [NSString stringWithFormat:@"%@ won!", mark];
    UIAlertView *gameOverAlert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                            message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [gameOverAlert show];
    
    _currentMark = @"";
    self.statusLabel.text = message;
    [self enableSquareButtons:NO];
}

- (BOOL)noEmptySquaresLeft
{
    if (self.row1Col1Button.currentTitle.length == 0)
        return NO;
    if (self.row1Col2Button.currentTitle.length == 0)
        return NO;
    if (self.row1Col3Button.currentTitle.length == 0)
        return NO;
    if (self.row2Col1Button.currentTitle.length == 0)
        return NO;
    if (self.row2Col2Button.currentTitle.length == 0)
        return NO;
    if (self.row2Col3Button.currentTitle.length == 0)
        return NO;
    if (self.row3Col1Button.currentTitle.length == 0)
        return NO;
    if (self.row3Col2Button.currentTitle.length == 0)
        return NO;
    if (self.row3Col3Button.currentTitle.length == 0)
        return NO;
    return YES;
}

- (void)gameEndedInTie
{
    NSString *message = @"Game ended in a tie!";
    UIAlertView *gameOverAlert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                            message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [gameOverAlert show];
    
    _currentMark = @"";
    self.statusLabel.text = message;
    [self enableSquareButtons:NO];
}

- (void)advanceTurn
{
    // Toggle Mark
    if ([_currentMark isEqualToString:@"X"])
        _currentMark = @"O";
    else
        _currentMark = @"X";
    
    self.statusLabel.text = [NSString stringWithFormat:@"%@'s turn", _currentMark];
}

@end
