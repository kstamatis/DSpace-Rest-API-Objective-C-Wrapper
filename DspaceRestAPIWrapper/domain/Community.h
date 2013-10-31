//
//  Community.h
//  DspaceRestAPIWrapper
//
//  Created by Kostas Stamatis on 10/30/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Bitstream.h"
#import "Collection.h"

#define COMMUNITY_EXPAND_ALL @"all"
#define COMMUNITY_EXPAND_LOGO @"logo"
#define COMMUNITY_EXPAND_COLLECTIONS @"collections"
#define COMMUNITY_EXPAND_PARENT_COMMUNITY @"parentCommunity"
#define COMMUNITY_EXPAND_SUBCOMMUNITIES @"subCommunities"

@interface Community : NSObject

#pragma mark - Community Attributes
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSNumber *dspaceID;
@property (nonatomic, strong) NSString *handle;
@property (nonatomic, strong) NSString *copyrightText;
@property (nonatomic, strong) NSString *introductoryText;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *sidebarText;

@property (nonatomic, strong) NSNumber *countItems;

@property (nonatomic, strong) NSArray *expand;

@property (nonatomic, strong) Community *parentCommunity;
@property (nonatomic, strong) NSArray *subCommunities;
@property (nonatomic, strong) NSArray *collections;
@property (nonatomic, strong) Bitstream *logo;

#pragma mark - Init methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
