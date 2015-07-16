//
//  BaseGetRestaurantsDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetRestaurantsDTO.h"

@implementation BaseGetRestaurantsDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetRestaurantsDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.isActivated=[self.isActivated copyWithZone:zone];
		copy.name=[self.name copyWithZone:zone];
		copy.url=[self.url copyWithZone:zone];
		copy.desc=[self.desc copyWithZone:zone];
		copy.m_t_open=[self.m_t_open copyWithZone:zone];
		copy.m_t_close=[self.m_t_close copyWithZone:zone];
		copy.t_t_open=[self.t_t_open copyWithZone:zone];
		copy.t_t_close=[self.t_t_close copyWithZone:zone];
		copy.avg_price=[self.avg_price copyWithZone:zone];
		copy.score=[self.score copyWithZone:zone];
		copy.totalTables=[self.totalTables copyWithZone:zone];
		copy.bookTables=[self.bookTables copyWithZone:zone];
		copy.lat=[self.lat copyWithZone:zone];
		copy.lon=[self.lon copyWithZone:zone];
		copy.prov=[self.prov copyWithZone:zone];
		copy.telf=[self.telf copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetRestaurantsDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.isActivated=self.isActivated;
		copy.name=self.name;
		copy.url=self.url;
		copy.desc=self.desc;
		copy.m_t_open=self.m_t_open;
		copy.m_t_close=self.m_t_close;
		copy.t_t_open=self.t_t_open;
		copy.t_t_close=self.t_t_close;
		copy.avg_price=self.avg_price;
		copy.score=self.score;
		copy.totalTables=self.totalTables;
		copy.bookTables=self.bookTables;
		copy.lat=self.lat;
		copy.lon=self.lon;
		copy.prov=self.prov;
		copy.telf=self.telf;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.isActivated = [decoder decodeObjectForKey:@"isActivated"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.url = [decoder decodeObjectForKey:@"url"];
	self.desc = [decoder decodeObjectForKey:@"desc"];
	self.m_t_open = [decoder decodeObjectForKey:@"m_t_open"];
	self.m_t_close = [decoder decodeObjectForKey:@"m_t_close"];
	self.t_t_open = [decoder decodeObjectForKey:@"t_t_open"];
	self.t_t_close = [decoder decodeObjectForKey:@"t_t_close"];
	self.avg_price = [decoder decodeObjectForKey:@"avg_price"];
	self.score = [decoder decodeObjectForKey:@"score"];
	self.totalTables = [decoder decodeObjectForKey:@"totalTables"];
	self.bookTables = [decoder decodeObjectForKey:@"bookTables"];
	self.lat = [decoder decodeObjectForKey:@"lat"];
	self.lon = [decoder decodeObjectForKey:@"lon"];
	self.prov = [decoder decodeObjectForKey:@"prov"];
	self.telf = [decoder decodeObjectForKey:@"telf"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.isActivated forKey:@"isActivated"];
	[encoder encodeObject:self.name forKey:@"name"];
	[encoder encodeObject:self.url forKey:@"url"];
	[encoder encodeObject:self.desc forKey:@"desc"];
	[encoder encodeObject:self.m_t_open forKey:@"m_t_open"];
	[encoder encodeObject:self.m_t_close forKey:@"m_t_close"];
	[encoder encodeObject:self.t_t_open forKey:@"t_t_open"];
	[encoder encodeObject:self.t_t_close forKey:@"t_t_close"];
	[encoder encodeObject:self.avg_price forKey:@"avg_price"];
	[encoder encodeObject:self.score forKey:@"score"];
	[encoder encodeObject:self.totalTables forKey:@"totalTables"];
	[encoder encodeObject:self.bookTables forKey:@"bookTables"];
	[encoder encodeObject:self.lat forKey:@"lat"];
	[encoder encodeObject:self.lon forKey:@"lon"];
	[encoder encodeObject:self.prov forKey:@"prov"];
	[encoder encodeObject:self.telf forKey:@"telf"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetRestaurantsDTO:(BaseGetRestaurantsDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.isActivated == other.isActivated || [self.isActivated isEqual:other.isActivated]);
    equals = equals && (self.name == other.name || [self.name isEqual:other.name]);
    equals = equals && (self.url == other.url || [self.url isEqual:other.url]);
    equals = equals && (self.desc == other.desc || [self.desc isEqual:other.desc]);
    equals = equals && (self.m_t_open == other.m_t_open || [self.m_t_open isEqual:other.m_t_open]);
    equals = equals && (self.m_t_close == other.m_t_close || [self.m_t_close isEqual:other.m_t_close]);
    equals = equals && (self.t_t_open == other.t_t_open || [self.t_t_open isEqual:other.t_t_open]);
    equals = equals && (self.t_t_close == other.t_t_close || [self.t_t_close isEqual:other.t_t_close]);
    equals = equals && (self.avg_price == other.avg_price || [self.avg_price isEqual:other.avg_price]);
    equals = equals && (self.score == other.score || [self.score isEqual:other.score]);
    equals = equals && (self.totalTables == other.totalTables || [self.totalTables isEqual:other.totalTables]);
    equals = equals && (self.bookTables == other.bookTables || [self.bookTables isEqual:other.bookTables]);
    equals = equals && (self.lat == other.lat || [self.lat isEqual:other.lat]);
    equals = equals && (self.lon == other.lon || [self.lon isEqual:other.lon]);
    equals = equals && (self.prov == other.prov || [self.prov isEqual:other.prov]);
    equals = equals && (self.telf == other.telf || [self.telf isEqual:other.telf]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetRestaurantsDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetRestaurantsDTO:(BaseGetRestaurantsDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.isActivated hash];
    theHash = theHash ^ [self.name hash];
    theHash = theHash ^ [self.url hash];
    theHash = theHash ^ [self.desc hash];
    theHash = theHash ^ [self.m_t_open hash];
    theHash = theHash ^ [self.m_t_close hash];
    theHash = theHash ^ [self.t_t_open hash];
    theHash = theHash ^ [self.t_t_close hash];
    theHash = theHash ^ [self.avg_price hash];
    theHash = theHash ^ [self.score hash];
    theHash = theHash ^ [self.totalTables hash];
    theHash = theHash ^ [self.bookTables hash];
    theHash = theHash ^ [self.lat hash];
    theHash = theHash ^ [self.lon hash];
    theHash = theHash ^ [self.prov hash];
    theHash = theHash ^ [self.telf hash];
	return theHash;
}

@end
 