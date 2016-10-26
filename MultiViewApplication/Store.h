//
//  Store.h
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Store : NSObject

@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSString *storeNumber;
@property (nonatomic, strong) UIColor *color;
@property NSMutableArray *groceryItems;


@end
