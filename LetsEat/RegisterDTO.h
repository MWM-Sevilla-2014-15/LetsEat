//
//  RegisterDTO.h
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 11/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterDTO : NSObject

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *pass;

@end
