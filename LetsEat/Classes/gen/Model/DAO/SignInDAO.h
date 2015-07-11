//
//  SignInDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignInDTO.h"

@interface SignInDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignInDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignInDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignInDTO *)instance;

@end