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

@interface LEMapController ()

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
    [self setMapView];
    
    self.userData = [NSUserDefaults standardUserDefaults];
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

- (void)setMapView
{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    CLLocationCoordinate2D coord;
    coord.latitude = 37.382942;
    coord.longitude = -5.983440400000063;
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = coord;
    annotation.title = @"La Mafia se sienta a la mesa";
    annotation.subtitle = @"Italiano";
    
    [self.mapView addAnnotation:annotation];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 100;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
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
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSLog(@"He pulsado sobre: %@", annotation);
    }
    [self performSegueWithIdentifier:@"openDetail" sender:nil];
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

@end
