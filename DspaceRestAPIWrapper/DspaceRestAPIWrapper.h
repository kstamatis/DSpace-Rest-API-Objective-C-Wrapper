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
#import "Item.h"

@interface DSpaceRestAPIWrapper : NSObject

+ (void) getCommunitiesForBaseURL:(NSString *)baseURL onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunitiesForBaseURL:(NSString *)baseURL expand:(NSArray *)expand onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID expand:(NSArray *)expand onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCollectionsForBaseURL:(NSString *)baseURL onSuccess:(void (^)(NSArray *collections)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCollectionsForBaseURL:(NSString *)baseURL expand:(NSArray *)expand onSuccess:(void (^)(NSArray *collections)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCollectionForBaseURL:(NSString *)baseURL collectionID:(NSNumber *)collectionID onSuccess:(void (^)(Collection *collection)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getCollectionForBaseURL:(NSString *)baseURL collectionID:(NSNumber *)collectionID expand:(NSArray *)expand onSuccess:(void (^)(Collection *collection)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getBitstreamForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID onSuccess:(void (^)(Bitstream *bitstream)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getBitstreamForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID expand:(NSArray *)expand onSuccess:(void (^)(Bitstream *bitstream)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getItemForBaseURL:(NSString *)baseURL itemID:(NSNumber *)itemID onSuccess:(void (^)(Item *item)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getItemForBaseURL:(NSString *)baseURL itemID:(NSNumber *)itemID expand:(NSArray *)expand onSuccess:(void (^)(Item *item)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getDSpaceObjectForBaseURL:(NSString *)baseURL prefix:(NSString *)prefix suffix:(NSString *)suffix onSuccess:(void (^)(DSpaceObject *dso)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getDSpaceObjectForBaseURL:(NSString *)baseURL prefix:(NSString *)prefix suffix:(NSString *)suffix expand:(NSArray *)expand onSuccess:(void (^)(DSpaceObject *dso)) success onFailure:(void (^)(NSError *error)) failure;
+ (void) getBitstreamDataForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID onSuccess:(void (^)(NSData *bitstreamData)) success onFailure:(void (^)(NSError *error)) failure;
@end
