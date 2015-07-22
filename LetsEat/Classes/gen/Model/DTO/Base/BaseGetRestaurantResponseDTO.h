//
//  BaseGetRestaurantResponseDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class GetRestaurantsDTO;


@interface BaseGetRestaurantResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSArray *items;	///<  - Field name on service:items.

- (BOOL)isEqualToBaseGetRestaurantResponseDTO:(BaseGetRestaurantResponseDTO *)other;

@end