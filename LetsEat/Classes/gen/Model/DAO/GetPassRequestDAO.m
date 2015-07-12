//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetPassRequestDTO.h"
#import "GetPassDTO.h"
#import "GetPassDAO.h"
#import "GetPassRequestDAO.h"

@implementation GetPassRequestDAO


// Get the shared instance and create it if necessary.
+ (GetPassRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPassRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetPassRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	
	NSDictionary *dictRequest=[[GetPassDAO sharedInstance] writeToDictionary:instance.request];
	dict[@"request"] = dictRequest;

	return dict;
}

-(GetPassRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetPassRequestDTO *instance=[[GetPassRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  
	if (dict[@"request"]) {
        instance.request=[[GetPassDAO sharedInstance] readFromDictionary:dict[@"request"]];
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
 
