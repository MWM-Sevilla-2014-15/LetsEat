//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantRequestDAO.h"

@implementation GetRestaurantRequestDAO


// Get the shared instance and create it if necessary.
+ (GetRestaurantRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetRestaurantRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetRestaurantRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	

	return dict;
}

-(GetRestaurantRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetRestaurantRequestDTO *instance=[[GetRestaurantRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  

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
 
