//
//  BaseSignInResponseDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseSignInResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *code;	///<  - Field name on service:code.
@property (nonatomic, strong) NSString *desc;	///<  - Field name on service:desc.

- (BOOL)isEqualToBaseSignInResponseDTO:(BaseSignInResponseDTO *)other;

@end