//
//  AddGroceryListItemViewController.h
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/12/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryItem.h"


@protocol AddGroceryListItemViewControllerDelegate <NSObject>

-(void) addGroceryListItemViewControllerDidAddItem:(GroceryItem *) groceryItem;
@end



@interface AddGroceryListItemViewController : UIViewController



@property (nonatomic, weak) IBOutlet UITextField *groceryItemTextField;

@property (nonatomic, weak) id<AddGroceryListItemViewControllerDelegate> delegate;



@end
