//
//  Item.m
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 11/1/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "Item.h"
#import "Bitstream.h"
#import "Collection.h"
#import "Community.h"

@implementation Item

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary{
    if (self = [super initWithDictionary:jsonDictionary]){
        self.archived = [jsonDictionary[@"archived"] boolValue];
        self.withdrawn = [jsonDictionary[@"withdrawn"] boolValue];
        self.lastModified = jsonDictionary[@"lastModified"];
        
        if (![self.expand containsObject:ITEM_EXPAND_BITSTREAMS]){
            if (jsonDictionary[@"bitstreams"] != [NSNull null]){
                NSArray *restBitstreams = jsonDictionary[@"bitstreams"];
                NSMutableArray *bits = [[NSMutableArray alloc] init];
                for (NSDictionary *restBitstream in restBitstreams){
                    Bitstream *bitstream = [[Bitstream alloc] initWithDictionary:restBitstream];
                    [bits addObject:bitstream];
                }
                self.bitstreams = [NSArray arrayWithArray:bits];
            }
        }
        
        if (![self.expand containsObject:ITEM_EXPAND_PARENT_COMMUNITY_LIST]){
            if (jsonDictionary[@"parentCommunityList"] != [NSNull null]){
                NSArray *restCommunities = jsonDictionary[@"parentCommunityList"];
                NSMutableArray *coms = [[NSMutableArray alloc] init];
                for (NSDictionary *restCommunity in restCommunities){
                    Community *community = [[Community alloc] initWithDictionary:restCommunity];
                    [coms addObject:community];
                }
                self.parentCommunityList = [NSArray arrayWithArray:coms];
            }
        }
        
        if (![self.expand containsObject:ITEM_EXPAND_PARENT_COLLECTION_LIST]){
            if (jsonDictionary[@"parentCollectionList"] != [NSNull null]){
                NSArray *restCollections = jsonDictionary[@"parentCollectionList"];
                NSMutableArray *cols = [[NSMutableArray alloc] init];
                for (NSDictionary *restCollection in restCollections){
                    Collection *collection = [[Collection alloc] initWithDictionary:restCollection];
                    [cols addObject:collection];
                }
                self.parentCollectionList = [NSArray arrayWithArray:cols];
            }
        }
        
        if (![self.expand containsObject:ITEM_EXPAND_PARENT_COLLECTION]){
            if (jsonDictionary[@"parentCollection"] != [NSNull null]){
                NSDictionary *restCollection = jsonDictionary[@"parentCollection"];
                Collection *collection = [[Collection alloc] initWithDictionary:restCollection];
                
                self.parentCollection = collection;
            }
        }
        if (![self.expand containsObject:ITEM_EXPAND_METADATA]){
            if (jsonDictionary[@"metadata"] != [NSNull null]){
                NSArray *metadata = jsonDictionary[@"metadata"];
                
                NSMutableDictionary *allMetadataDictionary = [[NSMutableDictionary alloc] init];
                
                for (NSDictionary *metadataDictionary in metadata){
                    NSString *key = metadataDictionary[@"key"];
                    NSString *value = metadataDictionary[@"value"];
                    
                    if ([allMetadataDictionary objectForKey:key]){
                        NSMutableArray *tmp = allMetadataDictionary[key];
                        [tmp addObject:value];
                    }
                    else {
                        NSMutableArray *tmp = [[NSMutableArray alloc] init];
                        [tmp addObject:value];
                        [allMetadataDictionary setObject:tmp forKey:key];
                    }
                }
                
                self.metadata = [NSDictionary dictionaryWithDictionary:allMetadataDictionary];
            }
        }
    }
    
    return self;
}

@end
