//
//  BaseGetRestaurant.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetRestaurantLogic.h"

#import "GenDefines.h"
#import "BaseGetRestaurantLogic.h"
#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantResponseDTO.h"


@implementation GetRestaurantLogic


// Get the shared instance and create it if necessary.
+ (GetRestaurantLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetRestaurantLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 