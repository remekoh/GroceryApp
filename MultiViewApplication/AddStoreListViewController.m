//
//  AddStoreListViewController.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/11/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "AddStoreListViewController.h"

@interface AddStoreListViewController ()

@end

@implementation AddStoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) addStoreButtonPressed {
 
    Store *store = [[Store alloc]init];
    store.storeName = self.addStoreNameTextField.text;
    store.storeNumber = self.addStoreNumberTextField.text;
    store.color = [UIColor lightGrayColor];
    store.groceryItems = [[NSMutableArray alloc]init];
    
    [self.delegate addStoreListViewControllerDidAddStore:store];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) cancelButtonPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
