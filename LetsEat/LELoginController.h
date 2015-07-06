//
//  LELoginController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LELoginController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *logoApp;
@property (strong, nonatomic) IBOutlet UILabel *labelCity;

@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSUserDefaults *userData;

@end
