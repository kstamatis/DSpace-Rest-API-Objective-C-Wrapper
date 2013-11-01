//
//  Bitstream.m
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 10/31/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import "Bitstream.h"

@implementation Bitstream

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary{
    if (self = [super initWithDictionary:jsonDictionary]){
        self.bundleName = jsonDictionary[@"bundleName"];
        self.checksumAlgorithm = jsonDictionary[@"checkSum"][@"checkSumAlgorithm"];
        self.checksumValue = jsonDictionary[@"checkSum"][@"value"];
        
        self.description = jsonDictionary[@"description"];
        self.format = jsonDictionary[@"format"];
        self.mimeType = jsonDictionary[@"mimeType"];
        self.retrieveLink = jsonDictionary[@"retrieveLink"];
        self.sequenceID = jsonDictionary[@"sequenceId"];
        self.sizeBytes = jsonDictionary[@"sizeBytes"];
        
        if (![self.expand containsObject:BITSTREAM_EXPAND_PARENT]){
            if (jsonDictionary[@"parentObject"] != [NSNull null]){
                self.parentObject = [[DSpaceObject alloc] initWithDictionary:jsonDictionary[@"parentObject"]];
            }
        }
    }
    
    return self;
}

@end
