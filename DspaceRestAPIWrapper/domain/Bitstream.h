//
//  Bitstream.h
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 10/31/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSpaceObject.h"

#define BITSTREAM_EXPAND_ALL @"all"
#define BITSTREAM_EXPAND_PARENT @"parent"

@interface Bitstream : DSpaceObject

@property (nonatomic, strong) NSString *bundleName;
@property (nonatomic, strong) NSString *checksumAlgorithm;
@property (nonatomic, strong) NSString *checksumValue;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSString *handle;
@property (nonatomic, strong) NSString *mimeType;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *retrieveLink;
@property (nonatomic, strong) NSNumber *sequenceID;
@property (nonatomic, strong) NSNumber *sizeBytes;

//expanded
@property (nonatomic, strong) DSpaceObject *parentObject;

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
