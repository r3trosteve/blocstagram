//
//  BLCMediaFullScreenAnimator.h
//  Blocstagram
//
//  Created by Steven Schofield on 10/08/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BLCMediaFullScreenAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;
@property (nonatomic, weak) UIImageView *cellImageView;

@end
