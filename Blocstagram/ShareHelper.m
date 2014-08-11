//
//  ShareHelper.m
//  Blocstagram
//
//  Created by Steven Schofield on 11/08/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import "ShareHelper.h"

@implementation ShareHelper

+ (void)shareMediaItem:(BLCMedia *)mediaItem fromViewController:(UIViewController *)viewController
{
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (mediaItem.caption.length > 0) {
        [itemsToShare addObject:mediaItem.caption];
    }
    
    if (mediaItem.image) {
        [itemsToShare addObject:mediaItem.image];
    }
    
    if (itemsToShare.count > 0) {
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        [viewController presentViewController:activityVC animated:YES completion:nil];
    }
}

@end
