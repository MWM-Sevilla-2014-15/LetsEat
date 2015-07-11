//
//  LEMenuListController.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMenuListController.h"
#import "CustomCell.h"
#import "SCLAlertView.h"
#import "UIColor+MyColor.h"

@interface LEMenuListController ()

@end

@implementation LEMenuListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Restaurantes";
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0.0, 2.0, 25.0, 20.0)];
    [button addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"burgerIcon"] forState:UIControlStateNormal];
    
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    //TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)showMenu
{
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"Cambiar ciudad" iconName:@"post_type_bubble_flickr"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Compartir" iconName:@"post_type_bubble_youtube"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Cerrar sesión" iconName:@"post_type_bubble_facebook"];
    [items addObject:menuItem];
    
    if (!self.popMenu) {
        self.popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:items];
        self.popMenu.menuAnimationType = kPopMenuAnimationTypeNetEase;
    }
    if (self.popMenu.isShowed) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.popMenu.didSelectedItemCompletion = ^(MenuItem *selectedItem) {
        NSLog(@"%@",selectedItem.title);
        if([selectedItem.title isEqualToString:@"Cerrar sesión"])
        {
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            SCLButton *button = [alert addButton:@"Continuar" target:weakSelf selector:@selector(logOut)];
            button.buttonFormatBlock = ^NSDictionary* (void)
            {
                NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
                buttonConfig[@"backgroundColor"] = [UIColor customSecondColor];
                buttonConfig[@"textColor"] = [UIColor whiteColor];
                return buttonConfig;
            };
            [alert showNotice:weakSelf title:@"AVISO" subTitle:@"¿Desea cerrar sesión?" closeButtonTitle:@"Cancelar" duration:0.0f];
        } else if ([selectedItem.title isEqualToString:@"Cambiar ciudad"]) {
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
    };
    
    [self.popMenu showMenuAtView:self.view];
}

- (void)logOut
{
    [self.userData setObject:@"" forKey:@"User"];
    [self.userData setObject:@"" forKey:@"Password"];
    [self.userData synchronize];
    [self performSegueWithIdentifier:@"openLogin" sender:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.item % 5 + 1;
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
    cell.labelNumberTables.text = @"45";
    cell.labelInfoDesc.text = @"10% en postres";
    cell.imageRest.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", index]];
    
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
    return indexPath.row == 5 - 1 ? 200 : 200;
}

//#pragma mark - Navigation
//
////In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     //Get the new view controller using [segue destinationViewController].
//     //Pass the selected object to the new view controller.
//}

@end
