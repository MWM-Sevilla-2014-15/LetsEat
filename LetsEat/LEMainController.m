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

static NSString *kCellId = @"cellId";
static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface LEMainController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, EAIntroDelegate>
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
            text = @"¿Qué es LET'sGoEAT?";
            break;
        case 1:
            text = @"Ubicación actual";
            break;
        case 2:
            text = @"Sevilla";
            break;
        case 3:
            text = @"Cádiz";
            break;
        case 4:
            text = @"Granada";
            break;
        default:
            break;
    }
    return text;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.item % 5 + 1;
    MPSkewedCell* cell = (MPSkewedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", index]];
    cell.text = [self titleForIndex:index];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.userData = [[NSUserDefaults alloc] init];
    
    if(indexPath.item == 0){
        [self createIntroView];
    } else if(indexPath.item == 1){
        [self performSegueWithIdentifier:@"openMap" sender:nil];
    } else if(indexPath.item == 2){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    } else if(indexPath.item == 3){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    } else if(indexPath.item == 4){
        [self performSegueWithIdentifier:@"openMenuList" sender:nil];
    }
}

- (void)createIntroView
{
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.pageView.backgroundColor = [UIColor customMainColor];
    page1.titleColor = [UIColor customMainColor];
    page1.desc = sampleDescription1;
    page1.descColor = [UIColor customMainColor];
    page1.bgColor = [UIColor whiteColor];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titleColor = [UIColor customMainColor];
    page2.desc = sampleDescription2;
    page2.descColor = [UIColor customMainColor];
    page2.bgColor = [UIColor whiteColor];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titleColor = [UIColor customMainColor];
    page3.desc = sampleDescription3;
    page3.descColor = [UIColor customMainColor];
    page3.bgColor = [UIColor whiteColor];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.titleColor = [UIColor customMainColor];
    page4.desc = sampleDescription4;
    page4.descColor = [UIColor customMainColor];
    page4.bgColor = [UIColor whiteColor];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds];
    [intro setDelegate:self];
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
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
    [intro showInView:rootView animateDuration:0.8];
}

@end
