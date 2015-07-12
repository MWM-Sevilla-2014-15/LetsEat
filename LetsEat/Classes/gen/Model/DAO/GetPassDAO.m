//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetPassDTO.h"
#import "GetPassDAO.h"

@implementation GetPassDAO


// Get the shared instance and create it if necessary.
+ (GetPassDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPassDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetPassDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.email) {
			dict[@"email"] = instance.email;
        }
		
	

	return dict;
}

-(GetPassDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetPassDTO *instance=[[GetPassDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"email"] && ![dict[@"email"] isKindOfClass:[NSNull class]]) {
	if([dict[@"email"] isKindOfClass:[NSString class]])
	{
		instance.email=dict[@"email"];
	}
	else
	{
		instance.email=[NSString stringWithFormat:@"%@",dict[@"email"]];
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
 
