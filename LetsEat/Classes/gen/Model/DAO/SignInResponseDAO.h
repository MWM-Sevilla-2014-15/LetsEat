//
//  SignInResponseDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignInResponseDTO.h"

@interface SignInResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignInResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignInResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignInResponseDTO *)instance;

@end