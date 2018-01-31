//
//  TodoTableViewController.m
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "TodoTableViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "TodoDetailViewController.h"
#import "NewTodoViewController.h"

@interface TodoTableViewController ()

@property (strong, nonatomic) NSMutableArray <Todo *> *list;

@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //reference for segue: https://www.ioscreator.com/tutorials/add-rows-to-tableview
    
    Todo *item1 = [[Todo alloc] initWithTitle:@"Groceries" todoDescription:@"Buy eggs, milk & butter" priorityNumber:2 isCompleted:NO];
    Todo *item2 = [[Todo alloc] initWithTitle:@"Pay bills" todoDescription:@"Credit card bill due Feb 1st" priorityNumber:1 isCompleted:NO];
    Todo *item3 = [[Todo alloc] initWithTitle:@"Pickup dry clean" todoDescription:@"Pickup on Jan 2th" priorityNumber:3 isCompleted:YES];
    
    self.list = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, nil];
    
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

    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];

    cell.todo = self.list[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"todoDetailShow"]) {
        
        TodoDetailViewController *todoDetailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = self.list[indexPath.row];
        todoDetailVC.todo = todo;
    }
    
}


- (IBAction)cancel:(UIStoryboardSegue *)segue {
    
}

- (IBAction)save:(UIStoryboardSegue *)segue {
    
    NewTodoViewController *newTodoVC = segue.sourceViewController;
    Todo *newItem = [[Todo alloc] initWithTitle:newTodoVC.itemTitle todoDescription:newTodoVC.itemDescription priorityNumber:newTodoVC.itemPriorityNumber isCompleted:NO];
    
    [self.list addObject:newItem];
    [self.tableView reloadData];
}


//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Delete object from array
        [self.list removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
}
}

// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//}


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
