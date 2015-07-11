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
    
    [self createView];
}

- (void)createView
{
    //Customizar label
    self.labelNameRest.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:28];
    self.labelNameRest.textColor = [UIColor whiteColor];
    self.labelNameRest.text = @"La Mafia se sienta a la mesa";
    
    self.labelScore.font = [UIFont fontWithName:@"Helvetica" size:9];
    self.labelScore.textColor = [UIColor customThirdColor];
    self.labelScore.text = @"Valoración";
    
    self.labelPrice.font = [UIFont fontWithName:@"Helvetica" size:9];
    self.labelPrice.textColor = [UIColor customThirdColor];
    self.labelPrice.text = @"Precio medio";
    
    self.labelTable.font = [UIFont fontWithName:@"Helvetica" size:9];
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
    
    self.labelDescription.textColor = [UIColor customThirdColor];
    self.labelDescription.text = @"Descripción:";
    
    self.labelInfoDesc.textColor = [UIColor customThirdColor];
    self.labelInfoDesc.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    
    //Customizar button
    [self.buttonBook setTitle:@"Reservar" forState:UIControlStateNormal];
    self.buttonBook.backgroundColor = [UIColor customMainColor];
    [self.buttonBook setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.buttonBook2 setTitle:@"Reservar" forState:UIControlStateNormal];
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
    
    self.customScrollView.contentSize = CGSizeMake(375, 969);
    //Respuesta rapida del boton cuando esta dentro de un UIScrollView
    self.customScrollView.delaysContentTouches = NO;
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
