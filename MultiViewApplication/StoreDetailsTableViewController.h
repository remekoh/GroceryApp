//
//  StoreDetailsTableViewController.h
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import "GroceryItem.h"
#import "AddGroceryListItemViewController.h"



@interface StoreDetailsTableViewController : UITableViewController<AddGroceryListItemViewControllerDelegate>

// Grocery Items Array
{
    NSMutableArray *groceryStores;
    NSMutableArray *groceryItems;
}

@property (nonatomic,strong) Store *selectedStore;
@property (nonatomic,assign) NSInteger selectedStoreIndex;



@end
