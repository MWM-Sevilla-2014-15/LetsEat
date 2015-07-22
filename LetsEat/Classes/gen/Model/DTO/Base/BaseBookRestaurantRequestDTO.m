//
//  BaseBookRestaurantRequestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseBookRestaurantRequestDTO.h"
#import "BookRestDTO.h"

@implementation BaseBookRestaurantRequestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseBookRestaurantRequestDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.request=[self.request copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseBookRestaurantRequestDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.request=[self.request mutableCopyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.request = [decoder decodeObjectForKey:@"request"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.request forKey:@"request"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseBookRestaurantRequestDTO:(BaseBookRestaurantRequestDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.request == other.request || [self.request isEqual:other.request]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseBookRestaurantRequestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseBookRestaurantRequestDTO:(BaseBookRestaurantRequestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.request hash];
	return theHash;
}

@end
 