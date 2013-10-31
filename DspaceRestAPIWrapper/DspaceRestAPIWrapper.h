//
//  DspaceRestAPIWrapper.h
//  DspaceRestAPIWrapper
//
//  Created by Kostas Stamatis on 10/30/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"
#import "Community.h"
#import "Collection.h"
#import "Bitstream.h"

@interface DSpaceRestAPIWrapper : NSObject

+ (void) getCommunitiesForBaseURL:(NSString *)baseURL onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunitiesForBaseURL:(NSString *)baseURL expand:(NSArray *)expand onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID expand:(NSArray *)expand onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure;
@end
