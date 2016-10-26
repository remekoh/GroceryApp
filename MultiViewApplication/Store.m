//
//  Store.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "Store.h"

@implementation Store

-(instancetype) initWithCoder:(NSCoder *)coder {
    self.groceryItems = [coder decodeObjectForKey:@"groceryItems"];
    self.storeName = [coder decodeObjectForKey:@"storeName"];
    self.storeNumber = [coder decodeObjectForKey:@"storeNumber"];
    self.color = [coder decodeObjectForKey:@"color"];
    return self;
}

-(void) encodeWithCoder: (NSCoder *) coder {
    [coder encodeObject:self.groceryItems forKey:@"groceryItems"];
    [coder encodeObject:self.storeName forKey:@"storeName"];
    [coder encodeObject:self.storeNumber forKey:@"storeNumber"];
    [coder encodeObject:self.color forKey:@"color"];
    
}

@end
