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
