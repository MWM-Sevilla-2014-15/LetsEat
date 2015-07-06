//
//  LELoginController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LELoginController.h"

@interface LELoginController ()

@end

@implementation LELoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self createView];
}

- (void)createView
{
    self.userData = [[NSUserDefaults alloc] init];
    self.labelCity.text = [self.userData stringForKey:@"Ciudad"];
    self.labelCity.font = [UIFont fontWithName:@"Chalkduster" size:30];
    UIImage *image = [UIImage imageNamed:@"title1"];
    [self.logoApp setImage:image];
}

@end
