//
//  DspaceRestAPIWrapper.m
//  DspaceRestAPIWrapper
//
//  Created by Kostas Stamatis on 10/30/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "DSpaceRestAPIWrapper.h"

#define PATH_COMMUNITIES_LIST @"/communities"
#define PATH_COMMUNITIES_SHOW @"/communities/%i"
#define PATH_COLLECTIONS_LIST @"/collections"
#define PATH_COLLECTIONS_SHOW @"/collections/%i"
#define PATH_BITSTREAMS_SHOW @"/bitstreams/%i"
#define PATH_ITEMS_SHOW @"/items/%i"
#define PATH_HANDLE_SHOW @"/handle/%@/%@"
#define PATH_BITSTREAM_RETRIEVE @"/bitstreams/%i/retrieve"

@implementation DSpaceRestAPIWrapper

#pragma mark DSpace REST API
+ (void) getCommunitiesForBaseURL:(NSString *)baseURL onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure {
    
    [self getCommunitiesForBaseURL:baseURL expand:nil onSuccess:success onFailure:failure];
    
}

+ (void) getCommunitiesForBaseURL:(NSString *)baseURL expand:(NSArray *)expand onSuccess:(void (^)(NSArray *communities)) success onFailure:(void (^)(NSError *error)) failure {
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, PATH_COMMUNITIES_LIST];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSArray *restCommunities = (NSArray *)responseObject;
        NSMutableArray *communities = [[NSMutableArray alloc] init];
        for (NSDictionary *communityDictionary in restCommunities){
            Community *community = [[Community alloc] initWithDictionary:communityDictionary];
            [communities addObject:community];
        }
        
        //Call the success block
        success(communities);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
}

+ (void) getCollectionsForBaseURL:(NSString *)baseURL onSuccess:(void (^)(NSArray *collections)) success onFailure:(void (^)(NSError *error)) failure {
    
    [self getCollectionsForBaseURL:baseURL expand:nil onSuccess:success onFailure:failure];
    
}

+ (void) getCollectionsForBaseURL:(NSString *)baseURL expand:(NSArray *)expand onSuccess:(void (^)(NSArray *collections)) success onFailure:(void (^)(NSError *error)) failure {
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, PATH_COLLECTIONS_LIST];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSArray *restCollections = (NSArray *)responseObject;
        NSMutableArray *collections = [[NSMutableArray alloc] init];
        for (NSDictionary *collectionDictionary in restCollections){
            Collection *collection = [[Collection alloc] initWithDictionary:collectionDictionary];
            [collections addObject:collection];
        }
        
        //Call the success block
        success(collections);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
}

+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure {
    [self getCommunityForBaseURL:baseURL communityID:communityID expand:nil onSuccess:success onFailure:failure];
}

+ (void) getCommunityForBaseURL:(NSString *)baseURL communityID:(NSNumber *)communityID expand:(NSArray *)expand onSuccess:(void (^)(Community *community)) success onFailure:(void (^)(NSError *error)) failure {
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *path = [NSString stringWithFormat:PATH_COMMUNITIES_SHOW, [communityID intValue]];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSDictionary *communityDictionary = (NSDictionary *)responseObject;
        Community *community = [[Community alloc] initWithDictionary:communityDictionary];
        
        //Call the success block
        success(community);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
}

+ (void) getCollectionForBaseURL:(NSString *)baseURL collectionID:(NSNumber *)collectionID onSuccess:(void (^)(Collection *collection)) success onFailure:(void (^)(NSError *error)) failure{
    
    [self getCollectionForBaseURL:baseURL collectionID:collectionID expand:nil onSuccess:success onFailure:failure];
}

+ (void) getCollectionForBaseURL:(NSString *)baseURL collectionID:(NSNumber *)collectionID expand:(NSArray *)expand onSuccess:(void (^)(Collection *collection)) success onFailure:(void (^)(NSError *error)) failure{
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *path = [NSString stringWithFormat:PATH_COLLECTIONS_SHOW, [collectionID intValue]];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSDictionary *collectionDictionary = (NSDictionary *)responseObject;
        Collection *collection = [[Collection alloc] initWithDictionary:collectionDictionary];
        
        //Call the success block
        success(collection);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
}

+ (void) getBitstreamForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID onSuccess:(void (^)(Bitstream *bitstream)) success onFailure:(void (^)(NSError *error)) failure{
    
    [self getBitstreamForBaseURL:baseURL bitstreamID:bitstreamID expand:nil onSuccess:success onFailure:failure];
    
}

+ (void) getBitstreamForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID expand:(NSArray *)expand onSuccess:(void (^)(Bitstream *bitstream)) success onFailure:(void (^)(NSError *error)) failure{
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *path = [NSString stringWithFormat:PATH_BITSTREAMS_SHOW, [bitstreamID intValue]];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSDictionary *bitstreamDictionary = (NSDictionary *)responseObject;
        Bitstream *bitstream = [[Bitstream alloc] initWithDictionary:bitstreamDictionary];
        
        //Call the success block
        success(bitstream);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
}

+ (void) getItemForBaseURL:(NSString *)baseURL itemID:(NSNumber *)itemID onSuccess:(void (^)(Item *item)) success onFailure:(void (^)(NSError *error)) failure{
    
    [self getItemForBaseURL:baseURL itemID:itemID expand:nil onSuccess:success onFailure:failure];
}

+ (void) getItemForBaseURL:(NSString *)baseURL itemID:(NSNumber *)itemID expand:(NSArray *)expand onSuccess:(void (^)(Item *item)) success onFailure:(void (^)(NSError *error)) failure{
    
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *path = [NSString stringWithFormat:PATH_ITEMS_SHOW, [itemID intValue]];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSDictionary *itemDictionary = (NSDictionary *)responseObject;
        Item *item = [[Item alloc] initWithDictionary:itemDictionary];
        
        //Call the success block
        success(item);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
    
    return;
    
}

+ (void) getDSpaceObjectForBaseURL:(NSString *)baseURL prefix:(NSString *)prefix suffix:(NSString *)suffix onSuccess:(void (^)(DSpaceObject *dso)) success onFailure:(void (^)(NSError *error)) failure{
    
    [self getDSpaceObjectForBaseURL:baseURL prefix:prefix suffix:suffix expand:nil onSuccess:success onFailure:failure];
}

+ (void) getDSpaceObjectForBaseURL:(NSString *)baseURL prefix:(NSString *)prefix suffix:(NSString *)suffix expand:(NSArray *)expand onSuccess:(void (^)(DSpaceObject *dso)) success onFailure:(void (^)(NSError *error)) failure{
 
    //Build parameters
    NSDictionary *parameters = nil;
    if (expand && [expand count]>0){
        NSString *expandParam = expand[0];
        for (int i=1; i<[expand count]; i++){
            expandParam = [expandParam stringByAppendingFormat:@",%@", expand[i]];
        }
        
        parameters = @{@"expand": expandParam};
    }
    
    NSString *path = [NSString stringWithFormat:PATH_HANDLE_SHOW, prefix, suffix];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    //Do the actual call
    [DSpaceRestAPIWrapper GETForURL:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //From responseObject, create the array of communities to return
        NSDictionary *dsoDictionary = (NSDictionary *)responseObject;
        NSString *type = dsoDictionary[@"type"];
        
        DSpaceObject *dso = nil;
        
        if ([type isEqualToString:@"collection"]){
            dso = [[Collection alloc] initWithDictionary:dsoDictionary];
        }
        else if ([type isEqualToString:@"community"]){
            dso = [[Community alloc] initWithDictionary:dsoDictionary];
        }
        if ([type isEqualToString:@"item"]){
            dso = [[Item alloc] initWithDictionary:dsoDictionary];
        }
        
        //Call the success block
        success(dso);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];

}

+ (void) getBitstreamDataForBaseURL:(NSString *)baseURL bitstreamID:(NSNumber *)bitstreamID onSuccess:(void (^)(NSData *bitstreamData)) success onFailure:(void (^)(NSError *error)) failure{
    
    NSString *path = [NSString stringWithFormat:PATH_BITSTREAM_RETRIEVE, [bitstreamID intValue]];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, path];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSData *data = (NSData *)responseObject;
        
        //Call the success block
        success(data);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //Call the failure block
        failure(error);
    }];
}

#pragma mark - AFNetworking Methods

+ (void) GETForURL:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:urlString parameters:parameters success:success failure:failure];
    
}

@end
