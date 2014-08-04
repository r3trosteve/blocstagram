//
//  BLCUser.m
//  Blocstagram
//
//  Created by Steven Schofield on 31/07/2014.
//  Copyright (c) 2014 Double Digital. All rights reserved.
//

#import "BLCUser.h"

@implementation BLCUser

- (instancetype) initWithDictionary:(NSDictionary *)userDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = userDictionary[@"id"];
        self.userName = userDictionary[@"username"];
        self.fullName = userDictionary[@"full_name"];
        
        NSString *profileURLString = userDictionary[@"profile_picture"];
        NSURL *profileURL = [NSURL URLWithString:profileURLString];
        
        if (profileURL) {
            self.profilePictureURL = profileURL;
        }
    }
    
    return self;
}


@end
