//
//  LEDetailController.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEDetailController.h"
#import "UIColor+MyColor.h"
#import <QuartzCore/QuartzCore.h>

@interface LEDetailController ()

@end

@implementation LEDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Detalles";
    
    //Gesture metodo, cuando pulse la view se esconda
    UITapGestureRecognizer *singleFingerTapMap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(collapseView)];
    [self.mapView addGestureRecognizer:singleFingerTapMap];
    
    //Gesture metodo, cuando pulse la view se esconda
    UITapGestureRecognizer *singleFingerTapView =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(expandView)];
    [self.customView addGestureRecognizer:singleFingerTapView];
    
    UITapGestureRecognizer *singleFingerTapPhone =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(callNumber)];
    [self.labelInfoPhone setUserInteractionEnabled:YES];
    [self.labelInfoPhone addGestureRecognizer:singleFingerTapPhone];
    
    [self initMapView];
    [self createView];
}

- (void)createView
{
    //Customizar label
    self.labelNameRest.font = [UIFont fontWithName:@"Dosis-SemiBold" size:32];
    self.labelNameRest.textColor = [UIColor whiteColor];
    self.labelNameRest.text = @"La Mafia se sienta a la mesa";
    
    self.labelScore.font = [UIFont fontWithName:@"Dosis-Light" size:12];
    self.labelScore.textColor = [UIColor customThirdColor];
    self.labelScore.text = @"Valoración";
    
    self.labelPrice.font = [UIFont fontWithName:@"Dosis-Light" size:12];
    self.labelPrice.textColor = [UIColor customThirdColor];
    self.labelPrice.text = @"Precio medio";
    
    self.labelTable.font = [UIFont fontWithName:@"Dosis-Light" size:12];
    self.labelTable.textColor = [UIColor customThirdColor];
    self.labelTable.text = @"Mesas disponibles";
    
    self.labelCircleTable.font = [UIFont fontWithName:@"Noteworthy" size:12];
    self.labelCircleTable.textColor = [UIColor customThirdColor];
    self.labelCircleTable.text = @"/45";
    
    self.customLabelCircleTable.font = [UIFont fontWithName:@"Noteworthy" size:25];
    self.customLabelCircleTable.textColor = [UIColor customThirdColor];
    self.customLabelCircleTable.text = @"15";
    
    self.labelCircleScore.font = [UIFont fontWithName:@"Noteworthy" size:12];
    self.labelCircleScore.textColor = [UIColor customThirdColor];
    self.labelCircleScore.text = @"/5.0";
    
    self.customLabelCircleScore.font = [UIFont fontWithName:@"Noteworthy" size:25];
    self.customLabelCircleScore.textColor = [UIColor customThirdColor];
    self.customLabelCircleScore.text = @"4.3";
    
    self.labelCirclePrice.font = [UIFont fontWithName:@"Noteworthy" size:25];
    self.labelCirclePrice.textColor = [UIColor customThirdColor];
    self.labelCirclePrice.text = @"20€";
    
    self.labelInfoDesc.textColor = [UIColor customThirdColor];
    self.labelInfoDesc.font = [UIFont fontWithName:@"Dosis-Regular" size:19];
    self.labelInfoDesc.text = @"Para nosotros cenar en La Mafia es permitirnos un homenaje, porque nos deja la sensación de haber tenido una cena algo más especial. El sitio es muy agradable, lleno de rincones y detalles.";
    
    self.labelHour.textColor = [UIColor customThirdColor];
    self.labelHour.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    self.labelHour.text = @"Horario:";
    
    self.labelPhone.textColor = [UIColor customThirdColor];
    self.labelPhone.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    self.labelPhone.text = @"Teléfono:";
    
    self.labelDiscount.textColor = [UIColor customThirdColor];
    self.labelDiscount.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    self.labelDiscount.text = @"Descuentos:";
    
    self.labelInfoHour.textColor = [UIColor customThirdColor];
    self.labelInfoHour.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.labelInfoHour.text = @"12:30 - 16:30 / 21:00 - 00:00";
    
    self.labelInfoPhone.textColor = [UIColor customThirdColor];
    self.labelInfoPhone.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.labelInfoPhone.text = @"954532872";
    
    self.labelInfoDiscount.textColor = [UIColor customThirdColor];
    self.labelInfoDiscount.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.labelInfoDiscount.text = @"10% en postres";
    
    //Customizar button
    [self.buttonBook setTitle:@"Reservar" forState:UIControlStateNormal];
    self.buttonBook.titleLabel.font = [UIFont fontWithName:@"Dosis-SemiBold" size:22];
    self.buttonBook.backgroundColor = [UIColor customMainColor];
    [self.buttonBook setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.buttonBook2 setTitle:@"Reservar" forState:UIControlStateNormal];
    self.buttonBook2.titleLabel.font = [UIFont fontWithName:@"Dosis-SemiBold" size:22];
    self.buttonBook2.backgroundColor = [UIColor customMainColor];
    [self.buttonBook2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //Customizar carrousel
    self.carrouselView.imageGalleryDataSource = self;
    self.carrouselView.imageChangingDelay = 3;
    self.carrouselView.changeImagesAutormatically = YES;
    self.carrouselView.backgroundColor = [UIColor whiteColor];
    
    //Customizar circles
    self.circleTableView.layer.cornerRadius = self.circleTableView.frame.size.width / 2;
    self.circleTableView.clipsToBounds = YES;
    self.circleTableView.layer.borderWidth = 3.0f;
    self.circleTableView.layer.borderColor = [UIColor customSecondColor].CGColor;
    self.circleTableView.backgroundColor = [UIColor whiteColor];
    
    self.circleScoreView.layer.cornerRadius = self.circleTableView.frame.size.width / 2;
    self.circleScoreView.clipsToBounds = YES;
    self.circleScoreView.layer.borderWidth = 3.0f;
    self.circleScoreView.layer.borderColor = [UIColor customSecondColor].CGColor;
    self.circleScoreView.backgroundColor = [UIColor whiteColor];
    
    self.circlePriceView.layer.cornerRadius = self.circleTableView.frame.size.width / 2;
    self.circlePriceView.clipsToBounds = YES;
    self.circlePriceView.layer.borderWidth = 3.0f;
    self.circlePriceView.layer.borderColor = [UIColor customSecondColor].CGColor;
    self.circlePriceView.backgroundColor = [UIColor whiteColor];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, 209, 365, 2)];
    lineView.backgroundColor = [UIColor customSecondColor];
    [self.customViewContent addSubview:lineView];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(5, 332, 365, 2)];
    lineView2.backgroundColor = [UIColor customSecondColor];
    [self.customViewContent addSubview:lineView2];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(5, 473, 365, 2)];
    lineView3.backgroundColor = [UIColor customSecondColor];
    [self.customViewContent addSubview:lineView3];
    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(5, 578, 365, 2)];
    lineView4.backgroundColor = [UIColor customSecondColor];
    [self.customViewContent addSubview:lineView4];
    
    self.customScrollView.contentSize = CGSizeMake(375, 969);
    //Respuesta rapida del boton cuando esta dentro de un UIScrollView
    self.customScrollView.delaysContentTouches = NO;
}

- (void)initMapView
{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = 37.382942;
    region.center.longitude = -5.983440400000063;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:NO];
    
    CLLocationCoordinate2D coord;
    coord.latitude = 37.382942;
    coord.longitude = -5.983440400000063;
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = coord;
    
    [self.mapView addAnnotation:annotation];
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
            pinView.image = [UIImage imageNamed:@"annotation"];
            pinView.calloutOffset = CGPointMake(0, 32);
        
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

//MODIFICA EL COMPORTAMIENTO DEL BOTON CUANDO SE PULSA Y SE DEJA DE PULSAR
-(IBAction) buttonTouchDown:(id)sender {
    if(sender == self.buttonBook){
        self.buttonBook.backgroundColor = [UIColor customMainColorPress];
        [self.buttonBook setTitleColor:[UIColor customMainColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonBook2.backgroundColor = [UIColor customMainColorPress];
        [self.buttonBook2 setTitleColor:[UIColor customMainColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

-(IBAction) buttonTouchUpOutside:(id)sender {
    if(sender == self.buttonBook){
        self.buttonBook.backgroundColor = [UIColor customMainColor];
        [self.buttonBook setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonBook2.backgroundColor = [UIColor customMainColor];
        [self.buttonBook2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

-(IBAction) buttonTouchUpInside:(id)sender {
    if(sender == self.buttonBook){
        self.buttonBook.backgroundColor = [UIColor customMainColor];
        [self.buttonBook setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonBook2.backgroundColor = [UIColor customMainColor];
        [self.buttonBook2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

- (void)collapseView
{
    //Mover la UIVIEW
    NSTimeInterval animationDurationView = 1.0f;
    CGRect newFrameSizeView = CGRectMake(0, 600, 375, 667);;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDurationView];
    self.customView.frame = newFrameSizeView;
    [UIView commitAnimations];
    
    //Expandir el MAPVIEW
    NSTimeInterval animationDurationMap = 1.0f;
    CGRect newFrameSizeMap = CGRectMake(0, 0, 375, 667);;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDurationMap];
    self.mapView.frame = newFrameSizeMap;
    [MKMapView commitAnimations];
}

- (void)expandView
{
    //Mover la UIVIEW
    NSTimeInterval animationDurationView = 1.0f;
    CGRect newFrameSizeView = CGRectMake(0, 235, 375, 667);;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDurationView];
    self.customView.frame = newFrameSizeView;
    [UIView commitAnimations];
    
    //Expandir el MAPVIEW
    NSTimeInterval animationDurationMap = 1.0f;
    CGRect newFrameSizeMap = CGRectMake(0, 0, 375, 302);;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDurationMap];
    self.mapView.frame = newFrameSizeMap;
    [MKMapView commitAnimations];
}

- (void)callNumber
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:self.labelInfoPhone.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
}

#pragma mark - MAKImageGalleryViewDataSource

- (NSInteger)numberOfImagesInGallery:(MAKImageGalleryView *)galleryView {
    return 5;
}

- (UIImage *)imageInGalery:(MAKImageGalleryView *)galleryView atIndex:(NSInteger)index {
    NSString *const imageName = [NSString stringWithFormat:@"%zd", index + 1];
    return [UIImage imageNamed:imageName];
}

- (UIViewContentMode)imageGallery:(MAKImageGalleryView *)galleryView contentModeForImageAtIndex:(NSInteger)index {
    return UIViewContentModeScaleAspectFill;
}

@end
