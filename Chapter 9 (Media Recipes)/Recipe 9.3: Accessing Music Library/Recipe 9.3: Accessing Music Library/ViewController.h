//
//  ViewController.h
//  Recipe 9.3: Accessing Music Library
//
//  Created by Hans-Eric Grönlund on 7/31/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<MPMediaPickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (strong, nonatomic) MPMediaItemCollection *myCollection;
@property (strong, nonatomic) MPMusicPlayerController *player;

- (IBAction)addItems:(id)sender;
- (IBAction)prevTapped:(id)sender;
- (IBAction)playTapped:(id)sender;
- (IBAction)nextTapped:(id)sender;
- (IBAction)updateVolume:(id)sender;
- (IBAction)queueMusicByArtist:(id)sender;

@end
