//
//  BaseBookRestaurantResponseDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseBookRestaurantResponseDTO.h"

@implementation BaseBookRestaurantResponseDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseBookRestaurantResponseDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.code=[self.code copyWithZone:zone];
		copy.desc=[self.desc copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseBookRestaurantResponseDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.code=self.code;
		copy.desc=self.desc;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.code = [decoder decodeObjectForKey:@"code"];
	self.desc = [decoder decodeObjectForKey:@"desc"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.code forKey:@"code"];
	[encoder encodeObject:self.desc forKey:@"desc"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseBookRestaurantResponseDTO:(BaseBookRestaurantResponseDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.code == other.code || [self.code isEqual:other.code]);
    equals = equals && (self.desc == other.desc || [self.desc isEqual:other.desc]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseBookRestaurantResponseDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseBookRestaurantResponseDTO:(BaseBookRestaurantResponseDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.code hash];
    theHash = theHash ^ [self.desc hash];
	return theHash;
}

@end
 