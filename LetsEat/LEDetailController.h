//
//  LEDetailController.h
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MAKImageGalleryView.h"

@interface LEDetailController : UIViewController <MAKImageGalleryViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIView *customViewName;
@property (weak, nonatomic) IBOutlet UIView *customViewContent;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet MAKImageGalleryView *carrouselView;
@property (weak, nonatomic) IBOutlet UIScrollView *customScrollView;
@property (strong, nonatomic) IBOutlet UIView *circleTableView;
@property (strong, nonatomic) IBOutlet UIView *circleScoreView;
@property (strong, nonatomic) IBOutlet UIView *circlePriceView;

@property (weak, nonatomic) IBOutlet UILabel *labelNameRest;
@property (weak, nonatomic) IBOutlet UIButton *buttonBook;
@property (weak, nonatomic) IBOutlet UIButton *buttonBook2;
@property (weak, nonatomic) IBOutlet UILabel *labelTable;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelCircleTable;
@property (weak, nonatomic) IBOutlet UILabel *labelCircleScore;
@property (weak, nonatomic) IBOutlet UILabel *labelCirclePrice;
@property (weak, nonatomic) IBOutlet UILabel *customLabelCircleTable;
@property (weak, nonatomic) IBOutlet UILabel *customLabelCircleScore;
@property (weak, nonatomic) IBOutlet UILabel *labelInfoDesc;
@property (weak, nonatomic) IBOutlet UILabel *labelHour;
@property (weak, nonatomic) IBOutlet UILabel *labelPhone;
@property (weak, nonatomic) IBOutlet UILabel *labelDiscount;
@property (weak, nonatomic) IBOutlet UILabel *labelInfoHour;
@property (weak, nonatomic) IBOutlet UILabel *labelInfoPhone;
@property (weak, nonatomic) IBOutlet UILabel *labelInfoDiscount;

@end
