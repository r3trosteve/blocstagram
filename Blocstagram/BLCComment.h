//
//  BLCComment.h
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCUser;

@interface BLCComment : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) BLCUser *from;
@property (nonatomic, strong) NSString *text;

- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;

@end
