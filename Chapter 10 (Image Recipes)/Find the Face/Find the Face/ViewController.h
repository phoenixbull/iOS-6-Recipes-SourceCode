//
//  ViewController.h
//  Find the Face
//
//  Created by Hans-Eric Grönlund on 8/24/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIButton *findFaceButton;
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;

- (IBAction)findFace:(id)sender;

@end
