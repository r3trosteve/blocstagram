//
//  BLCDataSource.h
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCMedia;

@interface BLCDataSource : NSObject


+(instancetype) sharedInstance;
 @property (nonatomic, strong, readonly) NSMutableArray *mediaItems;

 - (void) deleteMediaItem:(BLCMedia *)item;

@end
