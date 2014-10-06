//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Edik Shklyar on 10/6/14.
//  Copyright (c) 2014 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
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

- (IBAction)onButtonPressedAdd:(id)sender
{
    [self.toDoItemsArray insertObject:self.myTextField.text atIndex:0];
    self.myTextField.text = @"";
    [self resignFirstResponder];
}
- (IBAction)onButtonPressedEdit:(id)sender {

}
@end
