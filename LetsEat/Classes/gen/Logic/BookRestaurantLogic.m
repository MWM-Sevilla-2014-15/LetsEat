//
//  BaseBookRestaurant.m
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BookRestaurantLogic.h"

#import "GenDefines.h"
#import "BaseBookRestaurantLogic.h"
#import "BookRestaurantRequestDTO.h"
#import "BookRestaurantResponseDTO.h"


@implementation BookRestaurantLogic


// Get the shared instance and create it if necessary.
+ (BookRestaurantLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static BookRestaurantLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 