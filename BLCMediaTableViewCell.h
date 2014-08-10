//
//  BLCMediaTableViewCell.h
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCMedia, BLCMediaTableViewCell;

@protocol BLCMediaTableViewCellDelegate <NSObject>

- (void) cell:(BLCMediaTableViewCell *)cell didTapImageView:(UIImageView *)imageView;
- (void) cell:(BLCMediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;


@end

@interface BLCMediaTableViewCell : UITableViewCell

@property (nonatomic, strong) BLCMedia *mediaItem;
@property (nonatomic, weak) id <BLCMediaTableViewCellDelegate> delegate;

+ (CGFloat) heightForMediaItem:(BLCMedia *)mediaItem width:(CGFloat)width;

@end
