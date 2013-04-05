//
//  ViewController.m
//  My Text Document Editor
//
//  Created by Hans-Eric Grönlund on 9/2/12.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)currentContentFilePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:self.filenameTextField.text];
}

- (void)saveContentToFile:(NSString *)filePath
{
    NSString *content = self.contentTextView.text;
    NSError *error;
    BOOL success = [content writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&error];
    if (!success)
    {
        NSLog(@"Unable to save file: %@\nError: %@", filePath, error);
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // User tapped Yes button, overwrite the file
        NSString *filePath = [self currentContentFilePath];
        [self saveContentToFile:filePath];
    }
}

- (IBAction)saveContent:(id)sender
{
    NSString *filePath = [self currentContentFilePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath])
    {
        UIAlertView *overwriteAlert = [[UIAlertView alloc] initWithTitle:@"File Exists" message:@"Do you want to replace the file?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [overwriteAlert show];
    }
    else
        [self saveContentToFile:filePath];
}

- (IBAction)loadContent:(id)sender
{
    NSString *filePath = [self currentContentFilePath];
    NSError *error;
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    if (error)
    {
        NSLog(@"Unable to load file: %@\nError: %@", filePath, error);
    }
    self.contentTextView.text = content;
}

- (IBAction)clearContent:(id)sender
{
    self.contentTextView.text = nil;
}
@end
