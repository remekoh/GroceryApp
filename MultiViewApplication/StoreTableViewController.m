//
//  StoreTableViewController.m
//  MultiViewApplication
//
//  Created by rem{e}koh on 10/10/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "StoreTableViewController.h"


@interface StoreTableViewController ()

@end

@implementation StoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // User Defaults for the grocery categories Name list
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *storeData = [defaults objectForKey:@"GroceryStores"];
    
    if(storeData == nil) {
        
        myStores = [NSMutableArray array];
    }
    else {
        
        myStores = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:storeData];
    }
    
    [self.tableView reloadData];

    
    
    
    
    
//    myStores = [[NSMutableArray alloc]init];
//    
//    Store *wholeFoods = [[Store alloc] init];
//    wholeFoods.storeName = @"Whole Foods";
//    wholeFoods.storeNumber = @"5300";
//    wholeFoods.color = [UIColor orangeColor];
//    wholeFoods.groceryItems = [[NSMutableArray alloc]init];
//    [myStores addObject:wholeFoods];
//    
//    Store *heb = [[Store alloc] init];
//    heb.storeName = @"HEB";
//    heb.storeNumber = @"5700";
//    heb.color = [UIColor brownColor];
//    heb.groceryItems = [[NSMutableArray alloc]init];
//    [myStores addObject:heb];
//    
//    Store *aldi = [[Store alloc] init];
//    aldi.storeName = @"ALDI";
//    aldi.storeNumber = @"7500";
//    aldi.color = [UIColor orangeColor];
//    aldi.groceryItems = [[NSMutableArray alloc]init];
//    [myStores addObject:aldi];
//
//    Store *walmart = [[Store alloc] init];
//    walmart.storeName = @"Walmart";
//    walmart.storeNumber = @"5000";
//    walmart.color = [UIColor brownColor];
//    walmart.groceryItems = [[NSMutableArray alloc]init];
//    [myStores addObject:walmart];
//
//    Store *kroger = [[Store alloc] init];
//    kroger.storeName = @"Kroger";
//    kroger.storeNumber = @"3500";
//    kroger.color = [UIColor orangeColor];
//    kroger.groceryItems = [[NSMutableArray alloc]init];
//    [myStores addObject:kroger];
    
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

//    return [myStores count];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *stores = [defaults objectForKey:@"GroceryStores"];
    NSMutableArray *storeArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:stores];
    return storeArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreTableViewCell" forIndexPath:indexPath];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *categories = [defaults objectForKey:@"GroceryStores"];
    NSArray *storeArray = [NSKeyedUnarchiver unarchiveObjectWithData:categories];
    
//    Store *store = myStores[indexPath.row];
    
    Store *store = storeArray[indexPath.row];
    
    cell.textLabel.text = store.storeName;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = store.storeNumber;
    cell.detailTextLabel.textColor = [UIColor lightTextColor];
    cell.backgroundColor = store.color;
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showStoreDetails"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Store *store = myStores[indexPath.row];
        
        StoreDetailsTableViewController *storeDetailsTableViewController = segue.destinationViewController;
        
        storeDetailsTableViewController.selectedStoreIndex = indexPath.row;
        
        storeDetailsTableViewController.selectedStore = store;
        
    } else {
        
        AddStoreListViewController *addStoreListViewController = segue.destinationViewController;
        
        addStoreListViewController.delegate = self;
    }
    
    
}

-(void) addStoreListViewControllerDidAddStore:(Store *)store   {
    
    [myStores addObject:store];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *storeData = [NSKeyedArchiver archivedDataWithRootObject:myStores];
    [defaults setObject:storeData forKey:@"GroceryStores"];
    [defaults synchronize];
    
    [self.tableView reloadData];
    
    
}


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
