//
//  BaseBookRestaurantRequestDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class BookRestDTO;


@interface BaseBookRestaurantRequestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) BookRestDTO *request;	///<  - Field name on service:request.

- (BOOL)isEqualToBaseBookRestaurantRequestDTO:(BaseBookRestaurantRequestDTO *)other;

@end