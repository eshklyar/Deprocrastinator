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

@property NSMutableArray *toDoItemsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItemsArray = [[NSMutableArray alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoItemRow" forIndexPath:indexPath];
    cell.textLabel.text = @"1";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.toDoItemsArray.count;
    return 3;
}

- (IBAction)onButtonPressedAdd:(id)sender
{
    
    self.myTextField.text = @"";
    [self resignFirstResponder];
}
- (IBAction)onButtonPressedEdit:(id)sender {
    
}
@end
