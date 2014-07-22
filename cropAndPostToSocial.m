//
//  cropAndPostToSocial.m
//  ImageCropDemo
//
//  Created by Scott Twichel on 7/21/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "cropAndPostToSocial.h"

@implementation cropAndPostToSocial

+ (void)cropAndPost:(NSString *)socialServiceType{
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGFloat screenScale = [[UIScreen mainScreen] scale];
//    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
//    screenBounds.size = screenSize;
////    screenBounds.origin = CGPointZero;
//    
//    /* Capture the screenshot */
//    UIGraphicsBeginImageContextWithOptions(screenSize, YES, 0.0);
////    if ([self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES]){
////        NSLog(@"Successfully draw the screenshot.");
////    } else {
////        NSLog(@"Failed to draw the screenshot.");
//    }
//    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    /* Clip the image to the selected rectangle*/
//    CGImageRef ref = screenshot.CGImage;
//    CGImageRef mySubimage = CGImageCreateWithImageInRect (ref, clipRegion);
//    UIImage *clippedScreenshot = [UIImage imageWithCGImage:mySubimage];
}

@end
