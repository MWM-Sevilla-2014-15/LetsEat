//
//  BookRestDAO.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "BookRestDTO.h"

@interface BookRestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (BookRestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(BookRestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(BookRestDTO *)instance;

@end