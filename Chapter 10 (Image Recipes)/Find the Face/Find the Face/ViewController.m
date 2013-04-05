//
//  ViewController.m
//  Find the Face
//
//  Created by Hans-Eric Grönlund on 8/24/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mainImageView.backgroundColor = [UIColor blackColor];
    self.faceImageView.backgroundColor = [UIColor blackColor];
    
    UIImage *image = [UIImage imageNamed:@"testimage.jpg"];
    if (image != nil)
    {
        self.mainImageView.image = image;
    }
    else
    {
        [self.findFaceButton setTitle:@"No Image" forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha = 0.6;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findFace:(id)sender
{
    UIImage *image = self.mainImageView.image;
    CIImage *coreImage = [[CIImage alloc] initWithImage:image];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:@"CIDetectorTypeFace"context:context options:[NSDictionary dictionaryWithObjectsAndKeys:@"CIDetectorAccuracyHigh", @"CIDetectorAccuracy", nil]];
    NSArray *features = [detector featuresInImage:coreImage];
    
    if ([features count] >0)
    {
        CIImage *faceImage = [coreImage imageByCroppingToRect:[[features lastObject] bounds]];
        UIImage *face = [UIImage imageWithCGImage:[context createCGImage:faceImage fromRect:faceImage.extent]];
        self.faceImageView.image = face;
        
        [self.findFaceButton setTitle:[NSString stringWithFormat:@"%i Face(s) Found", [features count]] forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha = 0.6;
    }
    else
    {
        [self.findFaceButton setTitle:@"No Faces Found"forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha = 0.6;
    }
}
@end
