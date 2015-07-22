//
//  GetRestaurantResponseDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetRestaurantsDTO.h"
#import "GetRestaurantResponseDTO.h"

@interface GetRestaurantResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetRestaurantResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetRestaurantResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetRestaurantResponseDTO *)instance;

@end