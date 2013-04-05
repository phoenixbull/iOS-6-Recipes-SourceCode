//
//  ViewController.m
//  Recipe 9.2: Recording Audio
//
//  Created by Hans-Eric Grönlund on 7/30/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize recordButton = _recordButton;
@synthesize playButton = _playButton;
@synthesize averageLabel = _averageLabel;
@synthesize peakLabel = _peakLabel;

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume)
    {
        [player play];
    }
}

- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume)
    {
        [recorder record];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup dafter loading the view, typically from a nib.
    self.recordedFilePath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"recording.wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:self.recordedFilePath];
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:nil error:&error];
    if (error)
    {
        NSLog(@"Error initializing recorder: %@", error);
    }
    self.recorder.meteringEnabled = YES;
    self.recorder.delegate = self;
    [self.recorder prepareToRecord];
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateLabels) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleRecording:(id)sender
{
    if ([self.recorder isRecording])
    {
        [self.recorder stop];
        [self.recordButton setTitle:@"Record" forState:UIControlStateNormal];
    }
    else
    {
        [self.recorder record];
        [self.recordButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

- (IBAction)togglePlaying:(id)sender
{
    if (self.player.playing)
    {
        [self.player pause];
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }
    else if (_newRecordingAvailable)
    {
        NSURL *url = [[NSURL alloc] initFileURLWithPath:self.recordedFilePath];
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (!error)
        {
            self.player.delegate = self;
            [self.player play];
        }
        else
        {
            NSLog(@"Error initializing player: %@", error);
        }
        [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
        _newRecordingAvailable = NO;
    }
    else if (self.player)
    {
        [self.player play];
        [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    _newRecordingAvailable = flag;
    [self.recordButton setTitle:@"Record" forState:UIControlStateNormal];
}

-(void)updateLabels
{
    [self.recorder updateMeters];
    self.averageLabel.text = [NSString stringWithFormat:@"%f", [self.recorder averagePowerForChannel:0]];
    self.peakLabel.text = [NSString stringWithFormat:@"%f", [self.recorder peakPowerForChannel:0]];
}

@end
