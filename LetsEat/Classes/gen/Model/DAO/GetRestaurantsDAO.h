//
//  GetRestaurantsDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetRestaurantsDTO.h"

@interface GetRestaurantsDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetRestaurantsDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetRestaurantsDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetRestaurantsDTO *)instance;

@end