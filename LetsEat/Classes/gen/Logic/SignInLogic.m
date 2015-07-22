//
//  BaseSignIn.m
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "SignInLogic.h"

#import "GenDefines.h"
#import "BaseSignInLogic.h"
#import "SignInRequestDTO.h"
#import "SignInResponseDTO.h"


@implementation SignInLogic


// Get the shared instance and create it if necessary.
+ (SignInLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignInLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 