//
//  LEMapController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMapController.h"
#import "UIImage+ImageEffects.h"

@interface LEMapController ()

@end

@implementation LEMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.title = @"Restaurantes cercanos";
    [self loadMenuItems];
    [self setMapView];
}

-(void)loadMenuItems {
    SIMenuItem *menuItem1 = [SIMenuItem menuItemWithTitle:@"Cambiar de ciudad" image:[UIImage imageNamed:@"Image1"]];
    SIMenuItem *menuItem2 = [SIMenuItem menuItemWithTitle:@"Compartir" image:[UIImage imageNamed:@"Image2"]];
    SIMenuItem *menuItem3 = [SIMenuItem menuItemWithTitle:@"Cerrar sesión" image:[UIImage imageNamed:@"Image3"]];
        
    [self.menuTableView setMenuItems:@[menuItem1, menuItem2, menuItem3]];
    self.backgroundTapDismissesMenu = NO;
    self.animationSpeed = 5;
    
//    UIViewController *vc1 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loginController"];
//    UIViewController *vc2 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loginController"];
//    UIViewController *vc3 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loginController"];
//    
//    self.viewControllers = @[vc1, vc2, vc3];
}

- (void)setMapView
{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 100;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
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
        region.center.longitude = currentLocation.coordinate.longitude;
        region.center.latitude = currentLocation.coordinate.latitude;
    }
    
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:YES];
}

@end
