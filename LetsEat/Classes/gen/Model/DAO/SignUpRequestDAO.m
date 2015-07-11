//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "SignUpRequestDTO.h"
#import "SignUpDTO.h"
#import "SignUpDAO.h"
#import "SignUpRequestDAO.h"

@implementation SignUpRequestDAO


// Get the shared instance and create it if necessary.
+ (SignUpRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignUpRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(SignUpRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	
	NSDictionary *dictRequest=[[SignUpDAO sharedInstance] writeToDictionary:instance.request];
	dict[@"request"] = dictRequest;

	return dict;
}

-(SignUpRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	SignUpRequestDTO *instance=[[SignUpRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  
	if (dict[@"request"]) {
        instance.request=[[SignUpDAO sharedInstance] readFromDictionary:dict[@"request"]];
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
 
