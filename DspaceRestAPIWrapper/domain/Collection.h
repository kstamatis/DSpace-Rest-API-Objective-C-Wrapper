//
//  Collection.h
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 10/31/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSpaceObject.h"

#define COLLECTION_EXPAND_ALL @"all"
#define COLLECTION_EXPAND_LOGO @"logo"
#define COLLECTION_EXPAND_PARENT_COMMUNITY_LIST @"parentCommunityList"
#define COLLECTION_EXPAND_PARENT_COMMUNITY @"parentCommunity"
#define COLLECTION_EXPAND_ITEMS @"items"
#define COLLECTION_EXPAND_LICENCE @"license"

@class Community;
@class Bitstream;

@interface Collection : DSpaceObject

@property (nonatomic, strong) NSString *copyrightText;
@property (nonatomic, strong) NSString *introductoryText;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *sidebarText;
@property (nonatomic, strong) NSNumber *numberItems;

//expanded
@property (nonatomic, strong) NSArray *parentCommunities;
@property (nonatomic, strong) Community *parentCommunity;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *licence;
@property (nonatomic, strong) Bitstream *logo;

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
