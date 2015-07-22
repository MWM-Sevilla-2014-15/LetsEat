//
//  BaseGetRestaurantsDTO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetRestaurantsDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSNumber *idRest;	///<  - Field name on service:id.
@property (nonatomic, strong) NSNumber *isActivated;	///<  - Field name on service:isActivated.
@property (nonatomic, strong) NSString *name;	///<  - Field name on service:name.
@property (nonatomic, strong) NSString *type;	///<  - Field name on service:type.
@property (nonatomic, strong) NSString *url;	///<  - Field name on service:url.
@property (nonatomic, strong) NSString *desc;	///<  - Field name on service:desc.
@property (nonatomic, strong) NSString *m_t_open;	///<  - Field name on service:m_t_open.
@property (nonatomic, strong) NSString *m_t_close;	///<  - Field name on service:m_t_close.
@property (nonatomic, strong) NSString *t_t_open;	///<  - Field name on service:t_t_open.
@property (nonatomic, strong) NSString *t_t_close;	///<  - Field name on service:t_t_close.
@property (nonatomic, strong) NSString *avg_price;	///<  - Field name on service:avg_price.
@property (nonatomic, strong) NSString *score;	///<  - Field name on service:score.
@property (nonatomic, strong) NSNumber *totalTables;	///<  - Field name on service:totalTables.
@property (nonatomic, strong) NSNumber *bookTables;	///<  - Field name on service:bookTables.
@property (nonatomic, strong) NSNumber *lat;	///<  - Field name on service:lat.
@property (nonatomic, strong) NSNumber *lon;	///<  - Field name on service:lon.
@property (nonatomic, strong) NSString *prov;	///<  - Field name on service:prov.
@property (nonatomic, strong) NSString *telf;	///<  - Field name on service:telf.

- (BOOL)isEqualToBaseGetRestaurantsDTO:(BaseGetRestaurantsDTO *)other;

@end