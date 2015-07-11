//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "SignInRequestDTO.h"
#import "SignInDTO.h"
#import "SignInDAO.h"
#import "SignInRequestDAO.h"

@implementation SignInRequestDAO


// Get the shared instance and create it if necessary.
+ (SignInRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignInRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(SignInRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	
	NSDictionary *dictRequest=[[SignInDAO sharedInstance] writeToDictionary:instance.request];
	dict[@"request"] = dictRequest;

	return dict;
}

-(SignInRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	SignInRequestDTO *instance=[[SignInRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  
	if (dict[@"request"]) {
        instance.request=[[SignInDAO sharedInstance] readFromDictionary:dict[@"request"]];
    }

	}
	return instance;
}


-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray
{
	NSMutableArray *mutableArray=[[NSMutableArray alloc]init];
	for(NSDictionary *dict in dictArray)
	{
		[mutableArray addObject:[self readFromDictionary:dict]];
	}
	return mutableArray;
}
@end
 
