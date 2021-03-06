//
//  Community.m
//  DspaceRestAPIWrapper
//
//  Created by Kostas Stamatis on 10/30/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "Community.h"

@implementation Community

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary{
    if (self = [super initWithDictionary:jsonDictionary]){
        if (jsonDictionary){
            self.copyrightText = jsonDictionary[@"copyrightText"];
            self.introductoryText = jsonDictionary[@"introductoryText"];
            if (jsonDictionary[@"shortDescription"] != [NSNull null]){
                self.shortDescription = jsonDictionary[@"shortDescription"];
            }
            self.sidebarText = jsonDictionary[@"sidebarText"];
            self.countItems = jsonDictionary[@"countItems"];
            
            if (![self.expand containsObject:COMMUNITY_EXPAND_LOGO]){
                if (jsonDictionary[@"logo"] != [NSNull null]){
                    self.logo = [[Bitstream alloc] initWithDictionary:jsonDictionary[@"logo"]];
                }
            }
            
            if (![self.expand containsObject:COMMUNITY_EXPAND_COLLECTIONS]){
                if (jsonDictionary[@"collections"] != [NSNull null]){
                    NSArray *restCollections = jsonDictionary[@"collections"];
                    NSMutableArray *cols = [[NSMutableArray alloc] init];
                    for (NSDictionary *restCollection in restCollections){
                        Collection *collection = [[Collection alloc] initWithDictionary:restCollection];
                        [cols addObject:collection];
                    }
                    self.collections = [NSArray arrayWithArray:cols];
                }
            }
            
            if (![self.expand containsObject:COMMUNITY_EXPAND_PARENT_COMMUNITY]){
                if (jsonDictionary[@"parentCommunity"] != [NSNull null]){
                    self.parentCommunity = [[Community alloc] initWithDictionary:jsonDictionary[@"parentCommunity"]];
                }
            }
            
            if (![self.expand containsObject:COMMUNITY_EXPAND_SUBCOMMUNITIES]){
                if (jsonDictionary[@"subcommunities"] != [NSNull null]){
                    NSArray *restSubcommunities = jsonDictionary[@"subcommunities"];
                    NSMutableArray *coms = [[NSMutableArray alloc] init];
                    for (NSDictionary *restCommunity in restSubcommunities){
                        Community *collection = [[Community alloc] initWithDictionary:restCommunity];
                        [coms addObject:collection];
                    }
                    self.subCommunities = [NSArray arrayWithArray:coms];
                }
            }
        }
    }
    
    return self;
}

@end
