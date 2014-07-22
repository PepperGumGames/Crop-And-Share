//
//  cropAndPostToSocial.h
//  ImageCropDemo
//
//  Created by Scott Twichel on 7/21/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>

typedef enum
{
    socialTypeTwitter,
    socialTypeFacebook
    
}SocialType;

@interface cropAndPostToSocial : NSObject

+ (void) cropAndPost:(SocialType)socialServiceType andView:(UIView*)screenView;

@end
