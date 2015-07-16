//
//  GetPassResponseDAO.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPassResponseDTO.h"

@interface GetPassResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPassResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPassResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPassResponseDTO *)instance;

@end