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
#import "SVProgressHUD.h"
#import "LEDetailController.h"

#import "GetRestaurantActionTask.h"
#import "GetRestaurantRequestDTO.h"
#import "RestaurantDTO.h"

@interface LEMenuListController ()

@property (nonatomic, strong) NSArray *arrayRestaurants;
@property (strong, nonatomic) RestaurantDTO *restaurant;

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
    self.tableView.separatorStyle = NO;
    
    [self loadRestaurants];
}

- (void)showMenu
{
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"Cambiar ciudad" iconName:@"cambiar-ciudad"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Mis reservas" iconName:@"reservas"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Cerrar sesión" iconName:@"cerrar-sesion"];
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
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
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

- (void)loadRestaurants
{
    [SVProgressHUD showWithStatus:@"Cargando..."];
    
    [GetRestaurantActionTask getRestaurantActionTaskForRequest:nil showLoadingView:NO completed:^(NSInteger statusCode, GetRestaurantResponseDTO *response) {
        self.arrayRestaurants = response.items;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } error:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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
    return self.arrayRestaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    RestaurantDTO *rest = [self.arrayRestaurants objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.labelName.text = rest.name;
    cell.labelType.text = rest.type;
    cell.labelHour.text = [self concatString:rest.m_t_open second:rest.m_t_close third:rest.t_t_open fourth:rest.t_t_close];
    cell.labelNumberTables.text = [rest.totalTables stringValue];
    cell.labelInfoDesc.text = @"10% en postres";
    cell.imageRest.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", indexPath.row + 1]];
    
    //Añadir badge
    NSNumber *tablesAvailables = [NSNumber numberWithFloat:([rest.totalTables floatValue] - [rest.bookTables floatValue])];
    cell.badgeView.badgeText = [tablesAvailables stringValue];
    if([tablesAvailables intValue] > 0){
        [[JSBadgeView appearance] setBadgeBackgroundColor:[UIColor customSuccessColor]];
    } else {
        [[JSBadgeView appearance] setBadgeBackgroundColor:[UIColor customErrorColor]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.restaurant = [self.arrayRestaurants objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"openDetail" sender:self];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == self.arrayRestaurants.count - 1 ? 200 : 200;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"openDetail"])
    {
        LEDetailController *destinationController = [segue destinationViewController];
        destinationController.restaurant = self.restaurant;
    }
    
}

- (NSString *)concatString:(NSString *)openDay second:(NSString *)closeDay third:(NSString *)openNight fourth:(NSString *)closeNight
{
    NSString *onePart = @"Abierto: ";
    NSString *twoPart = [onePart stringByAppendingString:openDay];
    NSString *threePart = [twoPart stringByAppendingString:@" - "];
    NSString *fourPart = [threePart stringByAppendingString:closeDay];
    NSString *fivePart = [fourPart stringByAppendingString:@" / "];
    NSString *sixPart = [fivePart stringByAppendingString:openNight];
    NSString *sevenPart = [sixPart stringByAppendingString:@" - "];
    return [sevenPart stringByAppendingString:closeNight];
}

@end
