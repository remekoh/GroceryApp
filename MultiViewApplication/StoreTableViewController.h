//
//  StoreTableViewController.h
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "Store.h"
#import <UIKit/UIKit.h>
#import "StoreDetailsTableViewController.h"
#import "AddStoreListViewController.h"


@interface StoreTableViewController : UITableViewController<AddStoreListViewControllerDelegate>



// Stores Array
{
    NSMutableArray *myStores;
}

@end
