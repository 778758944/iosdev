//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by xiaobo on 2018/6/19.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRItemsHeaderController.h"
#import "BNRImageStore.h"

void (^removeHandle) (UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * action, NSIndexPath * indexPath) {
    NSLog(@"row %ld", indexPath.row);
};

@interface BNRItemsViewController ()
@end

@implementation BNRItemsViewController
-(instancetype) init {
    self = [super initWithStyle: UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
        UINavigationItem * navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = rightBarItem;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    /*
    CGRect pos = {
        {
            0,
            200
        },
        {
            100,
            100
        }
    };
    BNRItemsHeaderController * header = [[BNRItemsHeaderController alloc] init: pos];
    [header setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:header];
    */
    return self;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSLog(@"row %ld, section %ld", (long)indexPath.row, indexPath.section);
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSArray * items = [[BNRItemStore sharedStore] allItems];
    BNRItem * item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    CGRect pos = {
        {
            0,
            200
        },
        {
            100,
            100
        }
    };
    BNRItemsHeaderController * hv = [[BNRItemsHeaderController alloc] init:pos];
    [hv setBackgroundColor:[UIColor redColor]];
    
//    [self.tableView setTableHeaderView:header];
}

-(IBAction)addNewItem:(id)sender {
    
    
    BNRItem * newItem = [[BNRItemStore sharedStore] createItem];
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"delete");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray * items = [[BNRItemStore sharedStore] allItems];
        BNRItem * item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

-(NSArray <UITableViewRowAction *> *) tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row %ld, section %ld", indexPath.row, indexPath.section);
    void (^removeHandle) (UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * action, NSIndexPath * indexPath) {
        NSLog(@"row %ld", indexPath.row);
        BNRItem * item = [[BNRItemStore sharedStore] allItems][indexPath.row];
        
        [[BNRItemStore sharedStore] removeItem:item];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    };
    UITableViewRowAction * action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Remove" handler:removeHandle];
    return @[action];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController * detailCtrl = [[BNRDetailViewController alloc] init];
    NSArray * items = [[BNRItemStore sharedStore] allItems];
    detailCtrl.item = items[indexPath.row];
    [self.navigationController pushViewController:detailCtrl animated:YES];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}
@end
