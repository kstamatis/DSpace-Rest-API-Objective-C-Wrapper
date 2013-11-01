//
//  Item.h
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 11/1/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSpaceObject.h"


#define ITEM_EXPAND_ALL @"all"
#define ITEM_EXPAND_METADATA @"metadata"
#define ITEM_EXPAND_PARENT_COLLECTION @"parentCollection"
#define ITEM_EXPAND_PARENT_COLLECTION_LIST @"parentCollectionList"
#define ITEM_EXPAND_PARENT_COMMUNITY_LIST @"parentCommunityList"
#define ITEM_EXPAND_BITSTREAMS @"bitstreams"

@class Collection;

@interface Item : DSpaceObject

@property (nonatomic) BOOL archived;
@property (nonatomic) BOOL withdrawn;
@property (nonatomic, strong) NSString *lastModified;

//expanded
@property (nonatomic, strong) NSArray *bitstreams;
@property (nonatomic, strong) NSDictionary *metadata;
@property (nonatomic, strong) Collection *parentCollection;
@property (nonatomic, strong) NSArray *parentCollectionList;
@property (nonatomic, strong) NSArray *parentCommunityList;

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
