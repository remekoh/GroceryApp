//
//  StoreDetailsTableViewController.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "StoreDetailsTableViewController.h"


@interface StoreDetailsTableViewController ()

@end

@implementation StoreDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
//    self.title = self.selectedStore.storeName;

    
    self.title = [NSString stringWithFormat:@"%@ : %@", self.selectedStore.storeName, self.selectedStore.storeNumber];
    
    self.view.backgroundColor = self.selectedStore.color;
    
//    NSString *titleString = self.selectedStore.groceryItems;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *storeData = [defaults objectForKey:self.title];
    NSData *groceryStoresData = [defaults objectForKey:@"GroceryStores"];
    
    groceryStores = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:groceryStoresData];
    
    self.selectedStore = groceryStores[self.selectedStoreIndex];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.selectedStore.groceryItems count];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AddGroceryListItemViewController *addGroceryListItemViewController = segue.destinationViewController;
    
    addGroceryListItemViewController.delegate = self;
    
}

-(void) addGroceryListItemViewControllerDidAddItem:(GroceryItem *) groceryItem {
    
    [self.selectedStore.groceryItems addObject:groceryItem];
    
    
    
    
//    if(self.selectedStore.groceryItems == nil) {
//        self.selectedStore.groceryItems = [NSMutableArray array];
//    }
//    
//    [self.selectedStore.groceryItems addObject:groceryItem];
    
    // get the grocery stores using key
    
    
    
   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    // convert to data using archive
    NSData *dataForStores = [NSKeyedArchiver archivedDataWithRootObject:groceryStores];
    
    // store the data into the nsuserdefaults 
    [defaults setObject:dataForStores forKey:@"GroceryStores"];
    
//    [defaults setObject:groceryStores forKey:@"GroceryStores"];
    [defaults synchronize];
    
//    NSData *dataForStores = [defaults objectForKey:@"GroceryStores"];
//    
//    NSMutableArray *stores = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:dataForStores];
    
    
    
    [self.tableView reloadData];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCell" forIndexPath:indexPath];

    GroceryItem *groceryitem = self.selectedStore.groceryItems[indexPath.row];
    
    cell.textLabel.text = groceryitem.itemName;
    
    return cell;
}


//    AddStoreListViewController *addStoreListViewController = segue.destinationViewController;
//    
//    addStoreListViewController.delegate = self;


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
