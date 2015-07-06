//
//  LEMainController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPSkewedCell.h"
#import "MPSkewedParallaxLayout.h"
#import <EAIntroView/EAIntroView.h>

@interface LEMainController : UIViewController <EAIntroDelegate>

@property (strong, nonatomic) NSUserDefaults *userData;

@end
