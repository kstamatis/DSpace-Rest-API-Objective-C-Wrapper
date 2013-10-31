//
//  Collection.h
//  DSpaceRestAPITest
//
//  Created by Kostas Stamatis on 10/31/13.
//  Copyright (c) 2013 kstamatis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject

#pragma mark - Init Methods
- (id) initWithDictionary:(NSDictionary *)jsonDictionary;

@end
