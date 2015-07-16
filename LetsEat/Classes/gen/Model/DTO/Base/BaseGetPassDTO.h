//
//  BaseGetPassDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetPassDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *email;	///<  - Field name on service:email.

- (BOOL)isEqualToBaseGetPassDTO:(BaseGetPassDTO *)other;

@end