//
//  BookRestaurantLogic.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseBookRestaurantLogic.h"
#import "BookRestaurantRequestDTO.h"
#import "BookRestaurantResponseDTO.h"

@interface BookRestaurantLogic : BaseBookRestaurantLogic
  // Get the shared instance and create it if necessary.
+ (BookRestaurantLogic *)sharedInstance;


@end