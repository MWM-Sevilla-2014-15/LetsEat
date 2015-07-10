//
//  LEMenuListController.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMenuListController.h"
#import "CustomCell.h"
#import "UIColor+MyColor.h"

@interface LEMenuListController ()

@end

@implementation LEMenuListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Restaurantes";
    
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc]init];
    backButton.title=@"Atrás";
    [backButton setTarget:self];
    [backButton setAction:@selector(backController)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    //TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.labelName.text = @"La Mafia se sienta a la mesa";
    cell.labelType.text = @"Italiano";
    cell.labelHour.text = @"Abierto: 12:30 - 16:30 / 21:00 - 00:00";
    cell.labelTables.text = @"Mesas disponibles:";
    cell.labelNumberTables.text = @"15";
    
    //Añadir badge
    cell.badgeView.badgeText = @"15";
    [[JSBadgeView appearance] setBadgeBackgroundColor:[UIColor customSuccessColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"openDetail" sender:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == 1 - 1 ? 200 : 200;
}

//#pragma mark - Navigation
//
////In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     //Get the new view controller using [segue destinationViewController].
//     //Pass the selected object to the new view controller.
//}

@end
