//
//  BaseGetPassRequestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPassRequestDTO.h"
#import "GetPassDTO.h"

@implementation BaseGetPassRequestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetPassRequestDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.request=[self.request copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetPassRequestDTO *copy=[[[self class] alloc] init];
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

- (BOOL)isEqualToBaseGetPassRequestDTO:(BaseGetPassRequestDTO *)other {
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
	if (![anObject isKindOfClass:[BaseGetPassRequestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetPassRequestDTO:(BaseGetPassRequestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.request hash];
	return theHash;
}

@end
 