//
//  LEMapController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SIFloatingMenuViewController.h"

@interface LEMapController : SIFloatingMenuViewController <MKMapViewDelegate,  CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) CLLocationManager *locationManager;

@end
