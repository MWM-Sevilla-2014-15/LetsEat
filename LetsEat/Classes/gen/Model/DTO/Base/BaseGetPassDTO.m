//
//  BaseGetPassDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPassDTO.h"

@implementation BaseGetPassDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetPassDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.email=[self.email copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetPassDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.email=self.email;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.email = [decoder decodeObjectForKey:@"email"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.email forKey:@"email"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetPassDTO:(BaseGetPassDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.email == other.email || [self.email isEqual:other.email]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetPassDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetPassDTO:(BaseGetPassDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.email hash];
	return theHash;
}

@end
 