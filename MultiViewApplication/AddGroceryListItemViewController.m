//
//  AddGroceryListItemViewController.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/12/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "AddGroceryListItemViewController.h"

@interface AddGroceryListItemViewController ()

@end

@implementation AddGroceryListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}

-(IBAction) addItemButtonPressed {
    
    
    GroceryItem *groceryItem = [[GroceryItem alloc]init];
    groceryItem.itemName = self.groceryItemTextField.text;
    [self.delegate addGroceryListItemViewControllerDidAddItem:groceryItem];

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cancelButtonPressed{
   [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
