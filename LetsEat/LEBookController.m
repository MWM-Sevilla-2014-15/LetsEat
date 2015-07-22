//
//  LEBookController.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 22/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEBookController.h"
#import "CustomCell.h"

@interface LEBookController ()

@end

@implementation LEBookController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Mis Reservas";
    
    //TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = NO;
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
    
    //RestaurantDTO *rest = [self.arrayRestaurants objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.labelName.text = @"Casa Paco";
    cell.labelType.text = @"Tapeo";
//    cell.labelHour.text = [self concatString:rest.m_t_open second:rest.m_t_close third:rest.t_t_open fourth:rest.t_t_close];
//    cell.labelNumberTables.text = [rest.totalTables stringValue];
//    cell.labelInfoDesc.text = @"10% en postres";
    cell.imageRest.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", indexPath.row + 1]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == 1 - 1 ? 200 : 200;
}

@end
