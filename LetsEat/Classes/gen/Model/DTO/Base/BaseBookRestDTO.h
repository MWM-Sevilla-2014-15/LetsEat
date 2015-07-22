//
//  BaseBookRestDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseBookRestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSNumber *idRest;	///<  - Field name on service:id.
@property (nonatomic, strong) NSNumber *Ntables2Book;	///<  - Field name on service:Ntables2Book.

- (BOOL)isEqualToBaseBookRestDTO:(BaseBookRestDTO *)other;

@end