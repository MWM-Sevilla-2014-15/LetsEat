//
//  GetPassDAO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPassDTO.h"

@interface GetPassDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPassDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPassDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPassDTO *)instance;

@end