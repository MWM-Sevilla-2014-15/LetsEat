//
//  BaseBookRestaurantResponseDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseBookRestaurantResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *code;	///<  - Field name on service:code.
@property (nonatomic, strong) NSString *desc;	///<  - Field name on service:desc.

- (BOOL)isEqualToBaseBookRestaurantResponseDTO:(BaseBookRestaurantResponseDTO *)other;

@end