//
//  GetPassLogic.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseGetPassLogic.h"
#import "GetPassRequestDTO.h"
#import "GetPassResponseDTO.h"

@interface GetPassLogic : BaseGetPassLogic
  // Get the shared instance and create it if necessary.
+ (GetPassLogic *)sharedInstance;


@end