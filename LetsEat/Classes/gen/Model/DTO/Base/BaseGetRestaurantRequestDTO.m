//
//  BaseGetRestaurantRequestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetRestaurantRequestDTO.h"

@implementation BaseGetRestaurantRequestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetRestaurantRequestDTO *copy=[[[self class] alloc] init];
    if(copy) {
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetRestaurantRequestDTO *copy=[[[self class] alloc] init];
	if(copy) {
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetRestaurantRequestDTO:(BaseGetRestaurantRequestDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetRestaurantRequestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetRestaurantRequestDTO:(BaseGetRestaurantRequestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
	return theHash;
}

@end
 