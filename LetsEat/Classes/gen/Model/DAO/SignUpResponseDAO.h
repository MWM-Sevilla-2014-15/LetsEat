//
//  SignUpResponseDAO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignUpResponseDTO.h"

@interface SignUpResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignUpResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignUpResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignUpResponseDTO *)instance;

@end