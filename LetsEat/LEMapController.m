//
//  LEMapController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMapController.h"
#import "LEMainController.h"
#import "SCLAlertView.h"
#import "UIColor+MyColor.h"
#import "SVProgressHUD.h"
#import "CustomAnnotation.h"
#import "LEDetailController.h"

#import "GetRestaurantActionTask.h"
#import "GetRestaurantRequestDTO.h"

@interface LEMapController ()

@property (nonatomic, strong) NSArray *arrayRestaurants;

@end

@implementation LEMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0.0, 2.0, 25.0, 20.0)];
    [button addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"burgerIcon"] forState:UIControlStateNormal];
    
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    self.title = @"Mapa de restaurantes";
    self.userData = [NSUserDefaults standardUserDefaults];
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
        } else if ([selectedItem.title isEqualToString:@"Mis reservas"]) {
            [weakSelf performSegueWithIdentifier:@"openBook" sender:nil];
        }
    };
    
    [self.popMenu showMenuAtView:self.view];
}

- (void)loadRestaurants
{
    [SVProgressHUD showWithStatus:@"Cargando..."];
    
    [GetRestaurantActionTask getRestaurantActionTaskForRequest:nil showLoadingView:NO completed:^(NSInteger statusCode, GetRestaurantResponseDTO *response) {
        self.arrayRestaurants = response.items;
        [self setMapView];
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

- (void)setMapView
{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    for(int i = 0; i < self.arrayRestaurants.count; i++)
    {
        RestaurantDTO *rest = [self.arrayRestaurants objectAtIndex:i];
        CLLocationCoordinate2D coord;
        coord.latitude = [rest.lat doubleValue];
        coord.longitude = [rest.lon doubleValue];
        CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithTitle:rest.name andCoordinate:coord];
        annotation.subtitle = rest.type;
        [self.mapView addAnnotation:annotation];
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 500;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotation"];
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"annotation"];
            pinView.calloutOffset = CGPointMake(0, 32);
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"annotation"]];
            pinView.leftCalloutAccessoryView = iconView;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSString *title = ((CustomAnnotation*)view.annotation).title;
    
    for(RestaurantDTO *item in self.arrayRestaurants)
    {
        if([item.name isEqualToString:title]){
            self.restaurant = item;
        }
    }
    
    [self performSegueWithIdentifier:@"openDetail" sender:self];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    
    if (currentLocation != nil) {
        region.center.latitude = self.locationManager.location.coordinate.latitude;
        region.center.longitude = self.locationManager.location.coordinate.longitude;
    }
    
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"openDetail"])
    {
        LEDetailController *destinationController = [segue destinationViewController];
        destinationController.restaurant = self.restaurant;
    }
    
}

@end
