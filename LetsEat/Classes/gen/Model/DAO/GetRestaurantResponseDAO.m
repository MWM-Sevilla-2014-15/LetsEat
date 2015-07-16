//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetRestaurantResponseDTO.h"
#import "GetRestaurantsDTO.h"
#import "GetRestaurantsDAO.h"
#import "GetRestaurantResponseDAO.h"

@implementation GetRestaurantResponseDAO


// Get the shared instance and create it if necessary.
+ (GetRestaurantResponseDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetRestaurantResponseDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetRestaurantResponseDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	

	NSMutableArray *arrayItems=[[NSMutableArray alloc]init];
	for(GetRestaurantsDTO *typeItem in instance.items)
	{
		NSDictionary *dictItems=[[GetRestaurantsDAO sharedInstance] writeToDictionary:typeItem];
		[arrayItems addObject:dictItems];
	}
	dict[@"items"] = arrayItems;

	return dict;
}

-(GetRestaurantResponseDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetRestaurantResponseDTO *instance=[[GetRestaurantResponseDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {
    instance.items=[[NSMutableArray alloc]init];


  

	NSDictionary *itemsItem = nil;
	if(![dict[@"items"] isKindOfClass:[NSNull class]])
	{
		itemsItem=dict[@"items"];
	}
	
	if([itemsItem isKindOfClass:[NSArray class]])
	{
		NSArray *itemsArray=dict[@"items"];
		NSMutableArray *itemsMutableArray=[[NSMutableArray alloc]init];
		for(NSDictionary *data in itemsArray)
		{
			GetRestaurantsDTO *item=[[GetRestaurantsDAO sharedInstance] readFromDictionary:data];
			[itemsMutableArray addObject:item];
		}
		instance.items=itemsMutableArray;
	}
	else if (itemsItem)
	{
		NSMutableArray *itemsMutableArray=[[NSMutableArray alloc]init];
		GetRestaurantsDTO *item=[[GetRestaurantsDAO sharedInstance] readFromDictionary:itemsItem];
		[itemsMutableArray addObject:item];
		instance.items=itemsMutableArray;
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
 
