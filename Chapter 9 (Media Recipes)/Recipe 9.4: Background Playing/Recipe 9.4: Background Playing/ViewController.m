//
//  ViewController.m
//  Recipe 9.4: Background Playing
//
//  Created by Hans-Eric Grönlund on 7/31/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize playButton;
@synthesize infoLabel;
@synthesize artworkImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.session = [AVAudioSession sharedInstance];
    NSError *error;
    [self.session setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (error)
    {
        NSLog(@"Error setting audio session category: %@", error);
    }
    [self.session setActive:YES error:&error];
    if (error)
    {
        NSLog(@"Error activating audio session: %@", error);
    }
    
    self.playlist = [[NSMutableArray alloc] init];
    self.player = [[AVPlayer alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateNowPlaying
{
    if (self.player.currentItem != nil)
    {
        MPMediaItem *currentMPItem = [self.playlist objectAtIndex:self.currentIndex];
        
        self.infoLabel.text = [NSString stringWithFormat:@"%@ - %@", [currentMPItem valueForProperty:MPMediaItemPropertyTitle],  [currentMPItem valueForProperty:MPMediaItemPropertyArtist]];
        
        UIImage *artwork = [[currentMPItem valueForProperty:MPMediaItemPropertyArtwork] imageWithSize:self.artworkImageView.frame.size];
        self.artworkImageView.image = artwork;
        
        if ([MPNowPlayingInfoCenter class])
        {
            NSString *title = [currentMPItem valueForProperty:MPMediaItemPropertyTitle];
            NSString *artist = [currentMPItem valueForProperty:MPMediaItemPropertyArtist];
            NSString *album = [currentMPItem valueForProperty:MPMediaItemPropertyAlbumTitle];
            
            NSDictionary *mediaInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                       artist, MPMediaItemPropertyArtist,
                                       title, MPMediaItemPropertyTitle,
                                       album, MPMediaItemPropertyAlbumTitle,
                                       [currentMPItem valueForProperty:MPMediaItemPropertyArtwork], MPMediaItemPropertyArtwork,
                                       nil];
            [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = mediaInfo;
        }
    }
    else
    {
        self.infoLabel.text = @"...";
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
        self.artworkImageView.image = nil;
    }
}

- (void)remoteControlReceivedWithEvent: (UIEvent *) receivedEvent
{
    if (receivedEvent.type == UIEventTypeRemoteControl)
    {
        switch (receivedEvent.subtype)
        {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [self togglePlay:self];
                break;
                
            case UIEventSubtypeRemoteControlPreviousTrack:
                [self goToPrevTrack:self];
                break;
                
            case UIEventSubtypeRemoteControlNextTrack:
                [self goToNextTrack:self];
                break;
                
            default:
                break;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)playerItemDidReachEnd:(NSNotification *)notification
{
    [self goToNextTrack:self];
}

-(AVPlayerItem *)avItemFromMPItem:(MPMediaItem *)mpItem
{
    NSURL *url = [mpItem valueForProperty:MPMediaItemPropertyAssetURL];

    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(playerItemDidReachEnd:)
     name:AVPlayerItemDidPlayToEndTimeNotification
     object:item];

    return item;
}

-(void)startPlayback
{
    [self.player play];
    [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
    [self updateNowPlaying];
}

-(void)startPlaybackWithItem:(MPMediaItem *)mpItem
{
    [self.player replaceCurrentItemWithPlayerItem:[self avItemFromMPItem:mpItem]];
    [self.player seekToTime:kCMTimeZero];
    [self startPlayback];
}

-(void)pausePlayback
{
    [self.player pause];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (IBAction)togglePlay:(id)sender
{
    if (self.playlist.count > 0)
    {
        if (self.player.currentItem == nil)
        {
            [self startPlaybackWithItem:[self.playlist objectAtIndex:0]];
        }
        else
        {
            // Player has an item, pause or resume playing it
            BOOL isPlaying = self.player.currentItem && self.player.rate != 0;
            if (isPlaying)
            {
                [self pausePlayback];
            }
            else
            {
                [self startPlayback];
            }
        }
    }
}

- (IBAction)queueFromLibrary:(id)sender
{
    MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    picker.delegate = self;
    picker.allowsPickingMultipleItems = YES;
    picker.prompt = @"Choose Some Music!";
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)clearPlaylist:(id)sender
{
    [self.player replaceCurrentItemWithPlayerItem:nil];
    [self.playlist removeAllObjects];
    [self updateNowPlaying];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    BOOL shallStartPlayer = self.playlist.count == 0;
    
    [self.playlist addObjectsFromArray:mediaItemCollection.items];
    
    if (shallStartPlayer)
        [self startPlaybackWithItem:[self.playlist objectAtIndex:0]];

    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)goToPrevTrack:(id)sender
{
    if (self.playlist.count == 0)
        return;
    
    if (CMTimeCompare(self.player.currentTime, CMTimeMake(5.0, 1)) > 0)
    {
        [self.player seekToTime:kCMTimeZero];
    }
    else
    {
        if (self.currentIndex == 0)
        {
            self.currentIndex = self.playlist.count - 1;
        }
        else
        {
            self.currentIndex -= 1;
        }
        MPMediaItem *previousItem = [self.playlist objectAtIndex:self.currentIndex];
        [self startPlaybackWithItem:previousItem];
    }
}

- (IBAction)goToNextTrack:(id)sender
{
    if (self.playlist.count == 0)
        return;
    
    if (self.currentIndex == self.playlist.count - 1)
    {
        self.currentIndex = 0;
    }
    else
    {
        self.currentIndex += 1;
    }
    MPMediaItem *nextItem = [self.playlist objectAtIndex:self.currentIndex];
    [self startPlaybackWithItem: nextItem];
}


@end
