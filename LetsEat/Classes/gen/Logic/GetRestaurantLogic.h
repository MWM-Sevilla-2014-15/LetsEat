//
//  GetRestaurantLogic.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseGetRestaurantLogic.h"
#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantResponseDTO.h"

@interface GetRestaurantLogic : BaseGetRestaurantLogic
  // Get the shared instance and create it if necessary.
+ (GetRestaurantLogic *)sharedInstance;


@end