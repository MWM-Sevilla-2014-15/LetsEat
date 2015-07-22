//
//  SignInRequestDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignInDTO.h"
#import "SignInRequestDTO.h"

@interface SignInRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignInRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignInRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignInRequestDTO *)instance;

@end