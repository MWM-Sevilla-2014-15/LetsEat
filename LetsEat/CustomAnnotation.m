//
//  CustomAnnotation.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 12/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize title, coordinate, subtitle;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
    title = ttl;
    coordinate = c2d;
    subtitle = @"Test Subtitle";
    return self;
}

@end
