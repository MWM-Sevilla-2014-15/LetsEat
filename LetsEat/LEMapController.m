//
//  LEMapController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMapController.h"
#import "LEMainController.h"

@interface LEMapController ()

@end

@implementation LEMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0.0, 2.0, 25.0, 20.0)];
    //[button addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"burgerIcon"] forState:UIControlStateNormal];
    
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = menuButton;
    
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc]init];
    backButton.title=@"Atrás";
    [backButton setTarget:self];
    [backButton setAction:@selector(backController)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.title = @"Restaurantes cercanos";
    [self setMapView];
}

- (void)backController
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
        region.center.latitude = self.locationManager.location.coordinate.latitude;
        region.center.longitude = self.locationManager.location.coordinate.longitude;
    }
    
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:YES];
}

@end
