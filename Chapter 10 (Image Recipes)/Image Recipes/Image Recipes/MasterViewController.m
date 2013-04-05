//
//  MasterViewController.m
//  Image Recipes
//
//  Created by Hans-Eric Grönlund on 8/21/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

-(NSMutableArray *)filteredImages
{
    if (!_filteredImages)
    {
        _filteredImages = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _filteredImages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mainImage == nil)
    {
        return 1;
    }
    else
    {
        return 6;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    if (indexPath.row == 0)
        cell.textLabel.text = NSLocalizedString(@"Selected Image", @"Detail");
    else if (indexPath.row == 1)
        cell.textLabel.text = NSLocalizedString(@"Resized Image", @"Detail");
    else if (indexPath.row == 2)
        cell.textLabel.text = NSLocalizedString(@"Scaled Image", @"Detail");
    else if (indexPath.row == 3)
    {
        CGSize thumbnailSize = CGSizeMake(120, 75);
        UIImage *displayImage = [self.filteredImages objectAtIndex:0];
        UIImage *thumbnailImage = [MasterViewController aspectFillImage:displayImage toSize:thumbnailSize];
        cell.imageView.image = thumbnailImage;
        cell.textLabel.text = NSLocalizedString(@"Hue Adjust", @"Detail");
    }
    else if (indexPath.row == 4)
    {
        CGSize thumbnailSize = CGSizeMake(120, 75);
        UIImage *displayImage = [self.filteredImages objectAtIndex:1];
        UIImage *thumbnailImage = [MasterViewController aspectFillImage:displayImage toSize:thumbnailSize];
        cell.imageView.image = thumbnailImage;
        cell.textLabel.text = NSLocalizedString(@"Straighten Filter", @"Detail");
    }
    else if (indexPath.row == 5)
    {
        CGSize thumbnailSize = CGSizeMake(120, 75);
        UIImage *displayImage = [self.filteredImages objectAtIndex:2];
        UIImage *thumbnailImage = [MasterViewController aspectFillImage:displayImage toSize:thumbnailSize];
        cell.imageView.image = thumbnailImage;
        cell.textLabel.text = NSLocalizedString(@"Series Filter", @"Detail");
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.mainImage != nil)
    {
        UIImage *image;
        NSString *label;
        BOOL showsButtons = NO;
        if (indexPath.row == 0)
        {
            image = self.mainImage;
            label = @"Select an Image to Display";
            showsButtons = YES;
        }
        else if (indexPath.row == 1)
        {
            image = [MasterViewController scaleImage:self.mainImage toSize:self.detailViewController.imageView.frame.size];
            label = @"Chosen Image Resized";
        }
        else if (indexPath.row == 2)
        {
            image = [MasterViewController aspectScaleImage:self.mainImage toSize:self.detailViewController.imageView.frame.size];
            label = @"Chosen Image Scaled";
        }
        else if (indexPath.row == 3)
        {
            image = [self.filteredImages objectAtIndex:0];
            CGSize contentSize = self.detailViewController.imageView.frame.size;
            image = [MasterViewController aspectScaleImage:image toSize:contentSize];
            label = @"Hue Adjustment";
        }
        else if (indexPath.row == 4)
        {
            image = [self.filteredImages objectAtIndex:1];
            CGSize contentSize = self.detailViewController.imageView.frame.size;
            image = [MasterViewController aspectScaleImage:image toSize:contentSize];
            label = @"Straightening Filter";
        }
        else if (indexPath.row == 5)
        {
            image = [self.filteredImages objectAtIndex:2];
            CGSize contentSize = self.detailViewController.imageView.frame.size;
            image = [MasterViewController aspectScaleImage:image toSize:contentSize];
            label = @"Series Filter";
        }
        [self.detailViewController configureDetailsWithImage:image label:label showsButtons:showsButtons];
    }
}

-(void)setMainImage:(UIImage *)image
{
    [self.filteredImages removeAllObjects];
    if (image != nil)
    {
        [self populateImageViewWithImage:image];
    }
    
    _mainImage = image;
    NSIndexPath *currentIndexPath = self.tableView.indexPathForSelectedRow;
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:currentIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
}

-(void)populateImageViewWithImage:(UIImage *)image
{
    CIImage *main = [[CIImage alloc] initWithImage:image];
    
    CIFilter *hueAdjust = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjust setDefaults];
    [hueAdjust setValue:main forKey:@"inputImage"];
    [hueAdjust setValue:[NSNumber numberWithFloat: 3.14/2.0f]
                 forKey:@"inputAngle"];
    CIImage *outputHueAdjust = [hueAdjust valueForKey:@"outputImage"];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage1 = [context createCGImage:outputHueAdjust fromRect:outputHueAdjust.extent];
    UIImage *outputImage1 = [UIImage imageWithCGImage:cgImage1];
    CGImageRelease(cgImage1);
    [self.filteredImages addObject:outputImage1];
    
    CIFilter *strFilter = [CIFilter filterWithName:@"CIStraightenFilter"];
    [strFilter setDefaults];
    [strFilter setValue:main forKey:@"inputImage"];
    [strFilter setValue:[NSNumber numberWithFloat:3.14f] forKey:@"inputAngle"];
    CIImage *outputStr = [strFilter valueForKey:@"outputImage"];
    CGImageRef cgImage2 = [context createCGImage:outputStr fromRect:outputStr.extent];
    UIImage *outputImage2 = [UIImage imageWithCGImage:cgImage2];
    CGImageRelease(cgImage2);
    [self.filteredImages addObject:outputImage2];
    
    CIFilter *seriesFilter = [CIFilter filterWithName:@"CIStraightenFilter"];
    [seriesFilter setDefaults];
    [seriesFilter setValue:outputHueAdjust forKey:@"inputImage"];
    [seriesFilter setValue:[NSNumber numberWithFloat:3.14/2.0f] forKey:@"inputAngle"];
    CIImage *outputSeries = [seriesFilter valueForKey:@"outputImage"];
    CGImageRef cgImage3 = [context createCGImage:outputSeries fromRect:outputSeries.extent];
    UIImage *outputImage3 = [UIImage imageWithCGImage:cgImage3];
    [self.filteredImages addObject:outputImage3];
}

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)aspectScaleImage:(UIImage *)image toSize:(CGSize)size
{
    if (image.size.height < image.size.width)
    {
        float ratio = size.height / image.size.height;
        CGSize newSize = CGSizeMake(image.size.width * ratio, size.height);
        
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    }
    else
    {
        float ratio = size.width / image.size.width;
        CGSize newSize = CGSizeMake(size.width, image.size.height*ratio);
        
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    }
    UIImage *aspectScaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aspectScaledImage;
}

+ (UIImage *)aspectFillImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    if (image.size.height< image.size.width)
    {
        float ratio = size.height/image.size.height;
        [image drawInRect:CGRectMake(0, 0, image.size.width*ratio, size.height)];
    }
    else
    {
        float ratio = size.width/image.size.width;
        [image drawInRect:CGRectMake(0, 0, size.width, image.size.height*ratio)];
    }
    UIImage *aspectScaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aspectScaledImage;
}

@end
