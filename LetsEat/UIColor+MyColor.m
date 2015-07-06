//
//  UIColor+MyColor.m
//  CIVIS
//
//  Created by Daniel Martin Jimenez on 8/5/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "UIColor+MyColor.h"

@implementation UIColor (MyColor)

+ (instancetype)customMainColor
{
    return [UIColor colorWithRed:73.0/255.0 green:190.0/255.0 blue:197.0/255.0 alpha:1.0];
}

+ (instancetype)customSecondColor
{
    return [UIColor colorWithRed:254.0/255.0 green:154.0/255.0 blue:46.0/255.0 alpha:1.0];
}

+ (instancetype)customThirdColor
{
    return [UIColor colorWithRed:132.0/255.0 green:132./255.0 blue:132./255.0 alpha:1.0];
}

+ (instancetype)customSecondColorPress
{
    return [UIColor colorWithRed:254.0/255.0 green:154.0/255.0 blue:46.0/255.0 alpha:0.5];
}

+ (instancetype)customThirdColorPress
{
    return [UIColor colorWithRed:132.0/255.0 green:132./255.0 blue:132./255.0 alpha:0.5];
}

@end
