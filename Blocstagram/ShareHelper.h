//
//  ShareHelper.h
//  Blocstagram
//
//  Created by Steven Schofield on 11/08/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLCMedia.h"

@interface ShareHelper : NSObject

+ (void)shareMediaItem:(BLCMedia *)mediaItem fromViewController:(UIViewController *)viewController;

@end
