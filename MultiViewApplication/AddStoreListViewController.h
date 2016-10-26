//
//  AddStoreListViewController.h
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/11/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@protocol AddStoreListViewControllerDelegate <NSObject>

-(void) addStoreListViewControllerDidAddStore:(Store *) store;

@end

@interface AddStoreListViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *addStoreNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *addStoreNumberTextField;

@property (nonatomic, weak) id<AddStoreListViewControllerDelegate> delegate;

@end
