//
//  GetRestaurantRequestDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetRestaurantRequestDTO.h"

@interface GetRestaurantRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetRestaurantRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetRestaurantRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetRestaurantRequestDTO *)instance;

@end