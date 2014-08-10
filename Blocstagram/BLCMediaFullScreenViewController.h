//
//  BLCMediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Steven Schofield on 09/08/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCMedia;

@interface BLCMediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype) initWithMedia:(BLCMedia *)media;

- (void) centerScrollView;

@end
