//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Edik Shklyar on 10/6/14.
//  Copyright (c) 2014 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *toDoItemsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.toDoItemsArray = [[NSMutableArray alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskID" forIndexPath:indexPath];
    cell.textLabel.text = [self.toDoItemsArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toDoItemsArray.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView setCellAccessory:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    if (cell.accessoryType == UITableViewCellAccessoryNone) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//
//    } else if (cell.accessoryType == UITableViewCellAccessoryNone)
//    {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//    return cell;
//}

- (IBAction)onTapped:(UIGestureRecognizer *)tapGesture
{
    CGPoint point = [tapGesture locationInView:self.tableView];
    NSIndexPath *path = [self.tableView indexPathForRowAtPoint:point];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];

    if ([self.editButton.titleLabel.text isEqualToString:@"Done"])
    {
        [self.toDoItemsArray removeObjectAtIndex:path.row];
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else if ([self.editButton.titleLabel.text isEqualToString:@"Edit"])
    {
        if (cell.accessoryType == UITableViewCellAccessoryNone) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    [self.tableView reloadData];
}
- (IBAction)onButtonPressedAdd:(id)sender
{
    [self.toDoItemsArray insertObject:self.myTextField.text atIndex:self.toDoItemsArray.count];
    [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow];
    [self.tableView numberOfRowsInSection:self.toDoItemsArray.count];
    [self.tableView reloadData];
    [self resignFirstResponder];
    self.myTextField.text = @"";
}
- (IBAction)onButtonPressedEdit:(id)sender {
    if ([self.editButton.titleLabel.text isEqualToString:@"Done"]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }else if ([self.editButton.titleLabel.text isEqualToString:@"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    }
}
@end
