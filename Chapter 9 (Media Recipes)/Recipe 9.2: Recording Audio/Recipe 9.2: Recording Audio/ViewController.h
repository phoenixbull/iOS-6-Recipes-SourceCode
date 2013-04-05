//
//  ViewController.h
//  Recipe 9.2: Recording Audio
//
//  Created by Hans-Eric Grönlund on 7/30/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate, AVAudioRecorderDelegate>
{
    BOOL _newRecordingAvailable;
}

@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UILabel *peakLabel;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioRecorder *recorder;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) NSString *recordedFilePath;

- (IBAction)toggleRecording:(id)sender;
- (IBAction)togglePlaying:(id)sender;

@end
