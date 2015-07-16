//
//  SignUpRequestDAO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignUpDTO.h"
#import "SignUpRequestDTO.h"

@interface SignUpRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignUpRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignUpRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignUpRequestDTO *)instance;

@end