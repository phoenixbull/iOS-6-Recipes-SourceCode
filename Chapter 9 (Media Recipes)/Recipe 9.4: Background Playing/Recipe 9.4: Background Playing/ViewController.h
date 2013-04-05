//
//  ViewController.h
//  Recipe 9.4: Background Playing
//
//  Created by Hans-Eric Grönlund on 7/31/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<MPMediaPickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (nonatomic, strong) AVAudioSession *session;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) NSMutableArray *playlist;
@property (nonatomic)NSInteger currentIndex;

- (IBAction)goToPrevTrack:(id)sender;
- (IBAction)goToNextTrack:(id)sender;
- (IBAction)togglePlay:(id)sender;
- (IBAction)queueFromLibrary:(id)sender;
- (IBAction)clearPlaylist:(id)sender;

@end
