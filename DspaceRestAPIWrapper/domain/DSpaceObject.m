//
//  DSpaceObject.m
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 11/1/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "DSpaceObject.h"

@implementation DSpaceObject

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary{
    if (self = [super init]){
        if (jsonDictionary){
            self.dspaceID = jsonDictionary[@"id"];
            self.name = jsonDictionary[@"name"];
            self.handle = jsonDictionary[@"handle"];
            self.type = jsonDictionary[@"type"];
            self.link = jsonDictionary[@"link"];
            self.expand = jsonDictionary[@"expand"];
        }
    }
    return self;
}

@end
