//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "BookRestaurantResponseDTO.h"
#import "BookRestaurantResponseDAO.h"

@implementation BookRestaurantResponseDAO


// Get the shared instance and create it if necessary.
+ (BookRestaurantResponseDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static BookRestaurantResponseDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(BookRestaurantResponseDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.code) {
			dict[@"code"] = instance.code;
        }
        if (instance.desc) {
			dict[@"desc"] = instance.desc;
        }
		
	

	return dict;
}

-(BookRestaurantResponseDTO *) readFromDictionary:(NSDictionary *)dict
{
	BookRestaurantResponseDTO *instance=[[BookRestaurantResponseDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"code"] && ![dict[@"code"] isKindOfClass:[NSNull class]]) {
	if([dict[@"code"] isKindOfClass:[NSString class]])
	{
		instance.code=dict[@"code"];
	}
	else
	{
		instance.code=[NSString stringWithFormat:@"%@",dict[@"code"]];
	}
        }
    if (dict[@"desc"] && ![dict[@"desc"] isKindOfClass:[NSNull class]]) {
	if([dict[@"desc"] isKindOfClass:[NSString class]])
	{
		instance.desc=dict[@"desc"];
	}
	else
	{
		instance.desc=[NSString stringWithFormat:@"%@",dict[@"desc"]];
	}
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
 
