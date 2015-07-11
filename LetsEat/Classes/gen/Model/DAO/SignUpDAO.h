//
//  SignUpDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignUpDTO.h"

@interface SignUpDAO : NSObject

// Get the shared instance and create it if necessary.
+ (SignUpDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(SignUpDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(SignUpDTO *)instance;

@end