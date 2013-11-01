//
//  Collection.m
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 10/31/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "Collection.h"

#import "Bitstream.h"
#import "Community.h"
#import "Item.h"

@implementation Collection

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary{
    if (self = [super initWithDictionary:jsonDictionary]){
        
        self.copyrightText = jsonDictionary[@"copyrightText"];
        self.introductoryText = jsonDictionary[@"introductoryText"];
        self.shortDescription = jsonDictionary[@"shortDescription"];
        self.sidebarText = jsonDictionary[@"sidebarText"];
        self.numberItems = jsonDictionary[@"numberItems"];
        
        if (![self.expand containsObject:COLLECTION_EXPAND_LOGO]){
            self.logo = [[Bitstream alloc] initWithDictionary:jsonDictionary[@"logo"]];
        }
        
        if (![self.expand containsObject:COLLECTION_EXPAND_LICENCE]){
            self.licence = jsonDictionary[@"licence"];
        }
        
        if (![self.expand containsObject:COLLECTION_EXPAND_PARENT_COMMUNITY_LIST]){
            if (jsonDictionary[@"parentCommunityList"] != [NSNull null]){
                NSArray *restCommunities = jsonDictionary[@"parentCommunityList"];
                NSMutableArray *coms = [[NSMutableArray alloc] init];
                for (NSDictionary *restCommunity in restCommunities){
                    Community *community = [[Community alloc] initWithDictionary:restCommunity];
                    [coms addObject:community];
                }
                self.parentCommunities = [NSArray arrayWithArray:coms];
            }
        }
        
        if (![self.expand containsObject:COLLECTION_EXPAND_PARENT_COMMUNITY]){
            if (jsonDictionary[@"parentCommunity"] != [NSNull null]){
                self.parentCommunity = [[Community alloc] initWithDictionary:jsonDictionary[@"parentCommunity"]];
            }
        }
        
        if (![self.expand containsObject:COLLECTION_EXPAND_ITEMS]){
            if (jsonDictionary[@"items"] != [NSNull null]){
                NSArray *restItems = jsonDictionary[@"items"];
                NSMutableArray *items = [[NSMutableArray alloc] init];
                for (NSDictionary *restItem in restItems){
                    Item *item = [[Item alloc] initWithDictionary:restItem];
                    [items addObject:item];
                }
                self.items = [NSArray arrayWithArray:items];
            }
        }
    }
    
    return self;
}
@end
