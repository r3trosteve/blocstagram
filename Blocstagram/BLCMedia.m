//
//  BLCMedia.m
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h"

@implementation BLCMedia

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = mediaDictionary[@"id"];
        self.user = [[BLCUser alloc] initWithDictionary:mediaDictionary[@"user"]];
        NSString *standardResolutionImageURLString = mediaDictionary[@"images"][@"standard_resolution"][@"url"];
        NSURL *standardResolutionImageURL = [NSURL URLWithString:standardResolutionImageURLString];
        
        if (standardResolutionImageURL) {
            self.mediaURL = standardResolutionImageURL;
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError;
        }
        
        NSDictionary *captionDictionary = mediaDictionary[@"caption"];
        
        // Caption might be null (if there's no caption)
        if ([captionDictionary isKindOfClass:[NSDictionary class]]) {
            self.caption = captionDictionary[@"text"];
        } else {
            self.caption = @"";
        }
        
        NSMutableArray *commentsArray = [NSMutableArray array];
        
        for (NSDictionary *commentDictionary in mediaDictionary[@"comments"][@"data"]) {
            BLCComment *comment = [[BLCComment alloc] initWithDictionary:commentDictionary];
            [commentsArray addObject:comment];
        }
        
        self.comments = commentsArray;
        
        
        BOOL userHasLiked = [mediaDictionary[@"user_has_liked"] boolValue];
        
        self.likeState = userHasLiked ? BLCLikeStateLiked : BLCLikeStateNotLiked;
        
        self.likeCount = mediaDictionary[@"likes"][@"count"];
        NSLog(@"%@", self.likeCount);

    }
    
    return self;
}

#pragma mark - NSCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.idNumber = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(idNumber))];
        self.user = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(user))];
        self.mediaURL = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mediaURL))];
        self.image = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(image))];
        
        if (self.image) {
            self.downloadState = BLCMediaDownloadStateHasImage;
        } else if (self.mediaURL) {
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError;
        }
        
        self.caption = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(caption))];
        self.comments = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(comments))];
        self.likeCount = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(likeCount))];
        self.likeState = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(likeState))];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.idNumber forKey:NSStringFromSelector(@selector(idNumber))];
    [aCoder encodeObject:self.user forKey:NSStringFromSelector(@selector(user))];
    [aCoder encodeObject:self.mediaURL forKey:NSStringFromSelector(@selector(mediaURL))];
    [aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))];
    [aCoder encodeObject:self.caption forKey:NSStringFromSelector(@selector(caption))];
    [aCoder encodeObject:self.comments forKey:NSStringFromSelector(@selector(comments))];
    [aCoder encodeObject:self.likeCount forKey:NSStringFromSelector(@selector(likeCount))];
    [aCoder encodeInteger:self.likeState forKey:NSStringFromSelector(@selector(likeState))];
}

@end
