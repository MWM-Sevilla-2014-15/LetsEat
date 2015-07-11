//
//  BaseSignInDTO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseSignInDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *name;	///<  - Field name on service:name.
@property (nonatomic, strong) NSString *pass;	///<  - Field name on service:pass.

- (BOOL)isEqualToBaseSignInDTO:(BaseSignInDTO *)other;

@end