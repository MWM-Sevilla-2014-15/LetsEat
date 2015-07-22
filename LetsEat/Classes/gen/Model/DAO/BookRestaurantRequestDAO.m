//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "BookRestaurantRequestDTO.h"
#import "BookRestDTO.h"
#import "BookRestDAO.h"
#import "BookRestaurantRequestDAO.h"

@implementation BookRestaurantRequestDAO


// Get the shared instance and create it if necessary.
+ (BookRestaurantRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static BookRestaurantRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(BookRestaurantRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	
	NSDictionary *dictRequest=[[BookRestDAO sharedInstance] writeToDictionary:instance.request];
	dict[@"request"] = dictRequest;

	return dict;
}

-(BookRestaurantRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	BookRestaurantRequestDTO *instance=[[BookRestaurantRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  
	if (dict[@"request"]) {
        instance.request=[[BookRestDAO sharedInstance] readFromDictionary:dict[@"request"]];
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
 
