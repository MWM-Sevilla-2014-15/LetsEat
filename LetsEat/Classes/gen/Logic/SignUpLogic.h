//
//  SignUpLogic.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseSignUpLogic.h"
#import "SignUpRequestDTO.h"
#import "SignUpResponseDTO.h"

@interface SignUpLogic : BaseSignUpLogic
  // Get the shared instance and create it if necessary.
+ (SignUpLogic *)sharedInstance;


@end