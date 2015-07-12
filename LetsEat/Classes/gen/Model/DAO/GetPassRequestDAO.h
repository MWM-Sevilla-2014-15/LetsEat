//
//  GetPassRequestDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPassDTO.h"
#import "GetPassRequestDTO.h"

@interface GetPassRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPassRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPassRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPassRequestDTO *)instance;

@end