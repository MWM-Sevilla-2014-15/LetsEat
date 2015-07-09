//
//  LEMenuListController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMenuListController.h"
#import "CustomCell.h"

@interface LEMenuListController ()

@end

@implementation LEMenuListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.title = @"Restaurantes";
    
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc]init];
    menuButton.title=@"Atrás";
    [menuButton setTarget:self];
    [menuButton setAction:@selector(backController)];
    
    self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)backController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    cell.labelName.text = @"Hola";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == 3 - 1 ? 140 : 140;
}

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
