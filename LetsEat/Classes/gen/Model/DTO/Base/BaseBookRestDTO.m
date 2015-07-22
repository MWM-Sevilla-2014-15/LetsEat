//
//  BaseBookRestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseBookRestDTO.h"

@implementation BaseBookRestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseBookRestDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.idRest=[self.idRest copyWithZone:zone];
		copy.Ntables2Book=[self.Ntables2Book copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseBookRestDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.idRest=self.idRest;
		copy.Ntables2Book=self.Ntables2Book;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.idRest = [decoder decodeObjectForKey:@"idRest"];
	self.Ntables2Book = [decoder decodeObjectForKey:@"Ntables2Book"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.idRest forKey:@"idRest"];
	[encoder encodeObject:self.Ntables2Book forKey:@"Ntables2Book"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseBookRestDTO:(BaseBookRestDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.idRest == other.idRest || [self.idRest isEqual:other.idRest]);
    equals = equals && (self.Ntables2Book == other.Ntables2Book || [self.Ntables2Book isEqual:other.Ntables2Book]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseBookRestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseBookRestDTO:(BaseBookRestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.idRest hash];
    theHash = theHash ^ [self.Ntables2Book hash];
	return theHash;
}

@end
 