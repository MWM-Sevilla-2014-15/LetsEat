//
//  BaseSignUpRequestDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class SignUpDTO;


@interface BaseSignUpRequestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) SignUpDTO *request;	///<  - Field name on service:request.

- (BOOL)isEqualToBaseSignUpRequestDTO:(BaseSignUpRequestDTO *)other;

@end