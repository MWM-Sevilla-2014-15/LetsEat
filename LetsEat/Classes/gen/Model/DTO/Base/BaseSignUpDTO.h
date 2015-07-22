//
//  BaseSignUpDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseSignUpDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *email;	///<  - Field name on service:email.
@property (nonatomic, strong) NSString *name;	///<  - Field name on service:name.
@property (nonatomic, strong) NSString *pass;	///<  - Field name on service:pass.

- (BOOL)isEqualToBaseSignUpDTO:(BaseSignUpDTO *)other;

@end