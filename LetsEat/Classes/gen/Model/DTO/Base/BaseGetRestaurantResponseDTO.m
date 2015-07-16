//
//  BaseGetRestaurantResponseDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetRestaurantResponseDTO.h"

@implementation BaseGetRestaurantResponseDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetRestaurantResponseDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.items=[self.items copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetRestaurantResponseDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.items=[self.items mutableCopyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.items = [decoder decodeObjectForKey:@"items"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.items forKey:@"items"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetRestaurantResponseDTO:(BaseGetRestaurantResponseDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.items == other.items || [self.items isEqual:other.items]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetRestaurantResponseDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetRestaurantResponseDTO:(BaseGetRestaurantResponseDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.items hash];
	return theHash;
}

@end
 