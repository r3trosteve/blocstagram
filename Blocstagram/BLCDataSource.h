//
//  BLCDataSource.h
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCMedia;

    typedef void (^BLCNewItemCompletionBlock)(NSError *error);

@interface BLCDataSource : NSObject

+(NSString *) instagramClientID;

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSString *accessToken;
@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;

- (void) deleteMediaItem:(BLCMedia *)item;
- (void) downloadImageForMediaItem:(BLCMedia *)mediaItem;

- (void) toggleLikeOnMediaItem:(BLCMedia *)mediaItem;
- (void) commentOnMediaItem:(BLCMedia *)mediaItem withCommentText:(NSString *)commentText;

- (void) requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;

@end
