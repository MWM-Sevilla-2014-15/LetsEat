//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "BookRestDTO.h"
#import "BookRestDAO.h"

@implementation BookRestDAO


// Get the shared instance and create it if necessary.
+ (BookRestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static BookRestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(BookRestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.idRest) {
			dict[@"id"] = instance.idRest;
        }
        if (instance.Ntables2Book) {
			dict[@"Ntables2Book"] = instance.Ntables2Book;
        }
		
	

	return dict;
}

-(BookRestDTO *) readFromDictionary:(NSDictionary *)dict
{
	BookRestDTO *instance=[[BookRestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"id"] && ![dict[@"id"] isKindOfClass:[NSNull class]]) {
		instance.idRest = dict[@"id"];
        }
    if (dict[@"Ntables2Book"] && ![dict[@"Ntables2Book"] isKindOfClass:[NSNull class]]) {
		instance.Ntables2Book = dict[@"Ntables2Book"];
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
 
