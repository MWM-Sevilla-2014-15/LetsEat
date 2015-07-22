//
//  LEMainController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LEMainController.h"
#import "LELoginController.h"
#import "UIColor+MyColor.h"
#import <SMPageControl/SMPageControl.h>
#import "SCLAlertView.h"

static NSString *kCellId = @"cellId";

@interface LEMainController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
{
    UIView *rootView;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSString *city;

@end

@implementation LEMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createMPSkewed];
    
    rootView = self.navigationController.view;
    self.userData = [NSUserDefaults standardUserDefaults];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)createMPSkewed
{
    self.navigationController.navigationBarHidden = YES;
    
    MPSkewedParallaxLayout *layout = [[MPSkewedParallaxLayout alloc] init];
    layout.lineSpacing = 10;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 300);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.collectionView registerClass:[MPSkewedCell class] forCellWithReuseIdentifier:kCellId];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [(MPSkewedParallaxLayout *)self.collectionView.collectionViewLayout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 300)];
}

- (NSString *)titleForIndex:(NSInteger)index {
    NSString *text = nil;
    switch (index - 1) {
        case 0:
            text = @"Ubicación actual";
            break;
        case 1:
            text = @"Sevilla";
            break;
        case 2:
            text = @"Cádiz";
            break;
        case 3:
            text = @"Granada";
            break;
        case 4:
            text = @"¿Qué es LET'sGoEAT?";
            break;
        case 5:
            text = @"Cerrar sesión";
            break;
        default:
            break;
    }
    return text;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.item % 6 + 1;
    MPSkewedCell* cell = (MPSkewedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", index]];
    cell.text = [self titleForIndex:index];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.userData = [[NSUserDefaults alloc] init];
    
    if(indexPath.item == 4){
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        [self createIntroView];
    } else if(indexPath.item == 0){
        [self performSegueWithIdentifier:@"openMap" sender:nil];
    } else if(indexPath.item == 1){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    } else if(indexPath.item == 2){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    } else if(indexPath.item == 3){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    } else if(indexPath.item == 5){
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        SCLButton *button = [alert addButton:@"Continuar" target:self selector:@selector(logOut)];
        button.buttonFormatBlock = ^NSDictionary* (void)
        {
            NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
            buttonConfig[@"backgroundColor"] = [UIColor customSecondColor];
            buttonConfig[@"textColor"] = [UIColor whiteColor];
            return buttonConfig;
        };
        [alert showNotice:self title:@"AVISO" subTitle:@"¿Desea cerrar sesión?" closeButtonTitle:@"Cancelar" duration:0.0f];
    }
}

- (void)logOut
{
    [self.userData setObject:@"" forKey:@"User"];
    [self.userData setObject:@"" forKey:@"Password"];
    [self.userData synchronize];
    [self performSegueWithIdentifier:@"openLogin" sender:nil];
}

- (void)createIntroView
{
    EAIntroPage *page1 = [EAIntroPage page];
    page1.pageView.backgroundColor = [UIColor customMainColor];
    page1.bgColor = [UIColor whiteColor];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.bgColor = [UIColor whiteColor];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.bgColor = [UIColor whiteColor];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.bgColor = [UIColor whiteColor];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds];
    [intro setDelegate:self];
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor customThirdColor];
    pageControl.currentPageIndicatorTintColor = [UIColor customMainColor];
    [pageControl sizeToFit];
    intro.pageControl = (UIPageControl *)pageControl;
    
    // show skipButton only on 4th page + animation
    intro.skipButton.alpha = 0.f;
    intro.skipButton.enabled = NO;
    [intro.skipButton setTitleColor:[UIColor customMainColor] forState:UIControlStateNormal];
    [intro.skipButton setTitle:@"Salir" forState:UIControlStateNormal];
    page4.onPageDidAppear = ^{
        intro.skipButton.enabled = YES;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 1.f;
        }];
    };
    page4.onPageDidDisappear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
        }];
    };
    
    [intro setPages:@[page1,page2,page3,page4]];    
    [intro showInView:rootView animateDuration:0.5];
}

- (void)introDidFinish:(EAIntroView *)introView
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

@end
