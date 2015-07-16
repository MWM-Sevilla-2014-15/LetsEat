//
//  BaseGetPassRequestDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class GetPassDTO;


@interface BaseGetPassRequestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) GetPassDTO *request;	///<  - Field name on service:request.

- (BOOL)isEqualToBaseGetPassRequestDTO:(BaseGetPassRequestDTO *)other;

@end