//
//  RestaurantDTO.h
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 16/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantDTO : NSObject

@property (strong, nonatomic) NSString *isActivated;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *m_t_open;
@property (strong, nonatomic) NSString *m_t_close;
@property (strong, nonatomic) NSString *t_t_open;
@property (strong, nonatomic) NSString *t_t_close;
@property (strong, nonatomic) NSString *avg_price;
@property (strong, nonatomic) NSString *score;
@property (strong, nonatomic) NSNumber *totalTables;
@property (strong, nonatomic) NSNumber *bookTables;
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lon;
@property (strong, nonatomic) NSString *prov;
@property (strong, nonatomic) NSString *telf;

@end
