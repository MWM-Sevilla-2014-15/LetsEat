//
//  BaseSignInDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseSignInDTO.h"

@implementation BaseSignInDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseSignInDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.name=[self.name copyWithZone:zone];
		copy.pass=[self.pass copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseSignInDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.name=self.name;
		copy.pass=self.pass;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.name = [decoder decodeObjectForKey:@"name"];
	self.pass = [decoder decodeObjectForKey:@"pass"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.name forKey:@"name"];
	[encoder encodeObject:self.pass forKey:@"pass"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseSignInDTO:(BaseSignInDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.name == other.name || [self.name isEqual:other.name]);
    equals = equals && (self.pass == other.pass || [self.pass isEqual:other.pass]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseSignInDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseSignInDTO:(BaseSignInDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.name hash];
    theHash = theHash ^ [self.pass hash];
	return theHash;
}

@end
 