//
//  BookRestaurantResponseDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "BookRestaurantResponseDTO.h"

@interface BookRestaurantResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (BookRestaurantResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(BookRestaurantResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(BookRestaurantResponseDTO *)instance;

@end