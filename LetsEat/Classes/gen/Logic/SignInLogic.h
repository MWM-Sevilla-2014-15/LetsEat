//
//  SignInLogic.h
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseSignInLogic.h"
#import "SignInRequestDTO.h"
#import "SignInResponseDTO.h"

@interface SignInLogic : BaseSignInLogic
  // Get the shared instance and create it if necessary.
+ (SignInLogic *)sharedInstance;


@end