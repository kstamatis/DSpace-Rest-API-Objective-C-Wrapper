//
//  DSpaceObject.h
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 11/1/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSpaceObject : NSObject

@property (nonatomic, strong) NSNumber *dspaceID;
@property (nonatomic, strong) NSString *handle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSArray *expand;

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
