//
//  BaseSignInRequestDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class SignInDTO;


@interface BaseSignInRequestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) SignInDTO *request;	///<  - Field name on service:request.

- (BOOL)isEqualToBaseSignInRequestDTO:(BaseSignInRequestDTO *)other;

@end