//
//  GroceryItem.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/12/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

-(instancetype) initWithCoder:(NSCoder *)coder {
    self.itemName =[coder decodeObjectForKey:@"itemName"];
    return self;
    
}


-(void) encodeWithCoder: (NSCoder *) coder {
    [coder encodeObject:self.itemName forKey:@"itemName"];
    
}


@end
