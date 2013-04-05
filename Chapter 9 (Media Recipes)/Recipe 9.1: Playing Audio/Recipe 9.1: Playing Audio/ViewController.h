//
//  ViewController.h
//  Recipe 9.1: Playing Audio
//
//  Created by Hans-Eric Grönlund on 7/29/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UILabel *peakLabel;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UISlider *panSlider;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (strong, nonatomic) AVAudioPlayer *player;

- (IBAction)updateRate:(id)sender;
- (IBAction)updatePan:(id)sender;
- (IBAction)updateVolume:(id)sender;
- (IBAction)playVibrateSound:(id)sender;
- (IBAction)startPlayer:(id)sender;
- (IBAction)pausePlayer:(id)sender;

@end
