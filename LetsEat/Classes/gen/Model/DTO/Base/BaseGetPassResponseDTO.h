//
//  BaseGetPassResponseDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetPassResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *code;	///<  - Field name on service:code.
@property (nonatomic, strong) NSString *desc;	///<  - Field name on service:desc.

- (BOOL)isEqualToBaseGetPassResponseDTO:(BaseGetPassResponseDTO *)other;

@end