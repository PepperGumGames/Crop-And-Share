//
//  ViewController.m
//  ImageCropDemo
//
//  Created by Scott Twichel on 7/14/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    CGRect headIPhone;
    CGRect chestIPhone;
    CGRect gauntletIPhone;
    CGRect swordIPhone;
    CGRect footIPhone;
    
    CGRect headIPhoneRetina;
    CGRect chestIPhoneRetina;
    CGRect gauntletIPhoneRetina;
    CGRect swordIPhoneRetina;
    CGRect footIPhoneRetina;
    
    CGFloat screenScale;
}

@end

@implementation ViewController{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Find the scale of the current screen, Non retina screens return 1, retina screens return 2
    screenScale = [[UIScreen mainScreen]scale];
    
    //assign rectangle values to be used in screen clippping for non retina screens
    headIPhone  = CGRectMake(167, 65, 80, 102);
    chestIPhone = CGRectMake(160, 177, 94, 116);
    gauntletIPhone = CGRectMake(241, 247, 46, 103);
    swordIPhone = CGRectMake(32, 291, 141, 223);
    footIPhone = CGRectMake(128, 488, 164, 100);
    
    //multiply non-retina rectangle values by the screen scale
    headIPhoneRetina = CGRectMake(headIPhone.origin.x*screenScale, headIPhone.origin.y*screenScale, headIPhone.size.width*screenScale, headIPhone.size.height*screenScale);
    chestIPhoneRetina = CGRectMake(chestIPhone.origin.x*screenScale, chestIPhone.origin.y*screenScale, chestIPhone.size.width*screenScale, chestIPhone.size.height*screenScale);
    gauntletIPhoneRetina = CGRectMake(gauntletIPhone.origin.x*screenScale, gauntletIPhone.origin.y*screenScale, gauntletIPhone.size.width*screenScale, gauntletIPhone.size.height*screenScale);
    swordIPhoneRetina = CGRectMake(swordIPhone.origin.x*screenScale, swordIPhone.origin.y*screenScale, swordIPhone.size.width*screenScale, swordIPhone.size.height*screenScale);
    footIPhoneRetina = CGRectMake(footIPhone.origin.x*screenScale, footIPhone.origin.y*screenScale, footIPhone.size.width*screenScale, footIPhone.size.height*screenScale);
    
/*
 Dynamically gather screen Dimensions
 CGRect screenBounds = [[UIScreen mainScreen] bounds];
 CGFloat screenScale = [[UIScreen mainScreen] scale];
 CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clipScreenImageToRect:(CGRect)rect{
    CGRect clipRegion = rect;
    
    /* Capture the screenshot */
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, 0.0);
    if ([self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES]){
        NSLog(@"Successfully draw the screenshot.");
    } else {
        NSLog(@"Failed to draw the screenshot.");
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    /* Clip the image to the selected rectangle*/
    CGImageRef ref = screenshot.CGImage;
    CGImageRef mySubimage = CGImageCreateWithImageInRect (ref, clipRegion);
    UIImage *clippedScreenshot = [UIImage imageWithCGImage:mySubimage];

    /* --OPTIONAL-- 
     Save Image to disk
     
     NSFileManager *fileManager = [[NSFileManager alloc] init];
     NSURL *picturesFolder = [fileManager URLForDirectory:NSPicturesDirectory
                                                 inDomain:NSUserDomainMask
                                        appropriateForURL:nil
                                                   create:YES
                                                    error:nil];
    
     // A timestamp should be added to the file name otherwise it will continue to overwrite itself
     NSURL *clippedScreenshotUrl = [picturesFolder
                            URLByAppendingPathComponent:@"screenshot.png"];
     NSData *clippedScreenshotData = UIImagePNGRepresentation(clippedScreenshot);
    
     if ([clippedScreenshotData writeToURL:clippedScreenshotUrl atomically:YES]){
        NSLog(@"Successfully saved screenshot to %@", clippedScreenshotUrl);
     } else {
        NSLog(@"Failed to save screenshot.");
     }*/
    
    
    /* Post the image to the selected social media account */
    // Tests to see if the user has linked the requested social account with iOS, returns a BOOL
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        // Creates an instance of SLCompostViewController for the specified service type
        SLComposeViewController *socialSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        // Adds default text and image
        [socialSheet setInitialText:@"Tweeting from within my own app!"];
        [socialSheet addImage: clippedScreenshot];
        // Presents the "tweet sheet" to the user
        [self presentViewController:socialSheet animated:YES completion:nil];
    }
    else{
        // creates a modal alert if the selected service isn't set up on the device
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry..."
                                  message:@"You can't post right now. Check that the service is set up in iOS and that the network is accessible"
                                  delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
        // Displays the modal alert
        [alertView show];
    }
}

- (IBAction)cropHead:(id)sender {
    if (screenScale!=1){
        [self clipScreenImageToRect:headIPhoneRetina];
    }
    else{
        [self clipScreenImageToRect:headIPhone];
    }
}

- (IBAction)cropChest:(id)sender {
    if (screenScale!=1){
        [self clipScreenImageToRect:chestIPhoneRetina];
    }
    else{
        [self clipScreenImageToRect:chestIPhone];
    }
}

- (IBAction)cropGuantlet:(id)sender {
    if (screenScale!=1){
        [self clipScreenImageToRect:gauntletIPhoneRetina];
    }
    else{
        [self clipScreenImageToRect:gauntletIPhone];
    }
}

- (IBAction)cropSword:(id)sender {
    if (screenScale!=1){
        [self clipScreenImageToRect:swordIPhoneRetina];
    }
    else{
        [self clipScreenImageToRect:swordIPhone];
    }
}

- (IBAction)cropShoes:(id)sender {
    if (screenScale!=1){
        [self clipScreenImageToRect:footIPhoneRetina];
    }
    else{
        [self clipScreenImageToRect:footIPhone];
    }
}
@end
