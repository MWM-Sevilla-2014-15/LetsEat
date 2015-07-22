//
//  BookRestaurantRequestDAO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "BookRestDTO.h"
#import "BookRestaurantRequestDTO.h"

@interface BookRestaurantRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (BookRestaurantRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(BookRestaurantRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(BookRestaurantRequestDTO *)instance;

@end