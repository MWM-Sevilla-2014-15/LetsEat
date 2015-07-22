//
//  BaseGetPass.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetPassLogic.h"

#import "GenDefines.h"
#import "BaseGetPassLogic.h"
#import "GetPassRequestDTO.h"
#import "GetPassResponseDTO.h"


@implementation GetPassLogic


// Get the shared instance and create it if necessary.
+ (GetPassLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPassLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 