//
//  ViewController.m
//  Recipe 8.7: Recording Video With AVCaptureSession
//
//  Created by Hans-Eric Grönlund on 7/23/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize captureButton;
@synthesize modeControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.captureSession = [[AVCaptureSession alloc] init];
    //Optional: self.captureSession.sessionPreset = AVCaptureSessionPresetMedium;
    
    AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    
    self.videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:nil];
    self.audioInput = [[AVCaptureDeviceInput alloc] initWithDevice:audioDevice error:nil];
    
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *stillImageOutputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:
                                              AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:stillImageOutputSettings];
    
    self.movieOutput = [[AVCaptureMovieFileOutput alloc] init];
    
    // Setup capture session for taking pictures
    [self.captureSession addInput:self.videoInput];
    [self.captureSession addOutput:self.stillImageOutput];
    
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    UIView *aView = self.view;
    previewLayer.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-140);
    [aView.layer addSublayer:previewLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) captureStillImage
{
    AVCaptureConnection *stillImageConnection = [self.stillImageOutput.connections objectAtIndex:0];
    if ([stillImageConnection isVideoOrientationSupported])
        [stillImageConnection setVideoOrientation:AVCaptureVideoOrientationPortrait];
    
    [[self stillImageOutput] captureStillImageAsynchronouslyFromConnection:stillImageConnection
                                                         completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error)
     {
         if (imageDataSampleBuffer != NULL)
         {
             NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
             ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
             UIImage *image = [[UIImage alloc] initWithData:imageData];
             [library writeImageToSavedPhotosAlbum:[image CGImage]
                                       orientation:(ALAssetOrientation)[image imageOrientation]
                                   completionBlock:^(NSURL *assetURL, NSError *error)
              {
                  UIAlertView *alert;
                  if (!error)
                  {
                      alert = [[UIAlertView alloc] initWithTitle:@"Photo Saved"
                                                         message:@"The photo was successfully saved to you photos library"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
                  }
                  else
                  {
                      alert = [[UIAlertView alloc] initWithTitle:@"Error Saving Photo"
                                                         message:@"The photo was not saved to you photos library"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
                  }
                  
                  [alert show];
              }
              ];
         }
         else
             NSLog(@"Error capturing still image: %@", error);
     }];
}

- (NSURL *) tempFileURL
{
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"output.mov"];
    NSURL *outputURL = [[NSURL alloc] initFileURLWithPath:outputPath];
    NSFileManager *manager = [[NSFileManager alloc] init];
    if ([manager fileExistsAtPath:outputPath])
    {
        [manager removeItemAtPath:outputPath error:nil];
    }
    return outputURL;
}

- (IBAction)capture:(id)sender
{
    if (self.modeControl.selectedSegmentIndex == 0)
    {
        // Picture Mode
        [self captureStillImage];
    }
    else
    {
        // Video Mode
        if (self.movieOutput.isRecording == YES)
        {
            [self.captureButton setTitle:@"Capture" forState:UIControlStateNormal];
            [self.movieOutput stopRecording];
        }
        else
        {
            [self.captureButton setTitle:@"Stop" forState:UIControlStateNormal];
            [self.movieOutput startRecordingToOutputFileURL:[self tempFileURL] recordingDelegate:self];
        }
    }
}

- (IBAction)updateMode:(id)sender
{
    [self.captureSession stopRunning];
    if (self.modeControl.selectedSegmentIndex == 0)
    {
        if (self.movieOutput.isRecording == YES)
        {
            [self.movieOutput stopRecording];
        }
        // Picture Mode
        [self.captureSession removeInput:self.audioInput];
        [self.captureSession removeOutput:self.movieOutput];
        [self.captureSession addOutput:self.stillImageOutput];
    }
    else
    {
        // Video Mode
        [self.captureSession removeOutput:self.stillImageOutput];
        [self.captureSession addInput:self.audioInput];
        [self.captureSession addOutput:self.movieOutput];
        
        // Set orientation of capture connections to portrait
        NSArray *array = [[self.captureSession.outputs objectAtIndex:0] connections];
        for (AVCaptureConnection *connection in array)
        {
            connection.videoOrientation = AVCaptureVideoOrientationPortrait;
        }
    }
    [self.captureButton setTitle:@"Capture" forState:UIControlStateNormal];
    
    [self.captureSession startRunning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.captureSession startRunning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.captureSession stopRunning];
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput
didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL
      fromConnections:(NSArray *)connections
                error:(NSError *)error
{
    BOOL recordedSuccessfully = YES;
    if ([error code] != noErr)
    {
        // A problem occurred: Find out if the recording was successful.
        id value = [[error userInfo] objectForKey:AVErrorRecordingSuccessfullyFinishedKey];
        if (value)
            recordedSuccessfully = [value boolValue];
        // Logging the problem anyway:
        NSLog(@"A problem occurred while recording: %@", error);
    }
    if (recordedSuccessfully) {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        
        [library writeVideoAtPathToSavedPhotosAlbum:outputFileURL
                                    completionBlock:^(NSURL *assetURL, NSError *error)
         {
             UIAlertView *alert;
             if (!error)
             {
                 alert = [[UIAlertView alloc] initWithTitle:@"Video Saved"
                                                    message:@"The movie was successfully saved to you photos library"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
             }
             else
             {
                 alert = [[UIAlertView alloc] initWithTitle:@"Error Saving Video"
                                                    message:@"The movie was not saved to you photos library"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
             }
             
             [alert show];
         }
         ];
    }
}
@end
