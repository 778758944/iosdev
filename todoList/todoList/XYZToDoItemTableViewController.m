//
//  XYZToDoItemTableViewController.m
//  todoList
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "XYZToDoItemTableViewController.h"

@interface XYZToDoItemTableViewController ()
@property NSMutableArray * toDoItems;
@end

@implementation XYZToDoItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [NSMutableArray new];
    [self loadInitialData];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ListPrototypeCell"];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.title = @"My To-Do Item";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(trigerAddToDoItem:)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) trigerAddToDoItem: (id)sender {
    XYZAddToDoItemViewController * vc = [XYZAddToDoItemViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) loadInitialData {
    XYZTodoItem * item1 = [XYZTodoItem new];
    XYZTodoItem * item2 = [XYZTodoItem new];
    XYZTodoItem * item3 = [XYZTodoItem new];
    item1.itemName = @"Buy milk";
    item2.itemName = @"Buy eggs";
    item3.itemName = @"Read a book";
    item3.completed = YES;
    [self.toDoItems addObject:item1];
    [self.toDoItems addObject:item2];
    [self.toDoItems addObject:item3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    XYZTodoItem * toDoItem = [self.toDoItems objectAtIndex: indexPath.row];
    
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed == YES) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [cell touchesBegan:<#(nonnull NSSet<UITouch *> *)#> withEvent:<#(nullable UIEvent *)#>]
    
    // Configure the cell...
    
    return cell;
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
