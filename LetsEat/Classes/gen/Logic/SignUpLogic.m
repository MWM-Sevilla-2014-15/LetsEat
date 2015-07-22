//
//  BaseSignUp.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "SignUpLogic.h"

#import "GenDefines.h"
#import "BaseSignUpLogic.h"
#import "SignUpRequestDTO.h"
#import "SignUpResponseDTO.h"


@implementation SignUpLogic


// Get the shared instance and create it if necessary.
+ (SignUpLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignUpLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 