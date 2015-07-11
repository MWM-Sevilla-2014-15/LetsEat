//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "SignUpDTO.h"
#import "SignUpDAO.h"

@implementation SignUpDAO


// Get the shared instance and create it if necessary.
+ (SignUpDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignUpDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(SignUpDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.email) {
			dict[@"email"] = instance.email;
        }
        if (instance.name) {
			dict[@"name"] = instance.name;
        }
        if (instance.pass) {
			dict[@"pass"] = instance.pass;
        }
		
	

	return dict;
}

-(SignUpDTO *) readFromDictionary:(NSDictionary *)dict
{
	SignUpDTO *instance=[[SignUpDTO alloc]init];
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
    if (dict[@"name"] && ![dict[@"name"] isKindOfClass:[NSNull class]]) {
	if([dict[@"name"] isKindOfClass:[NSString class]])
	{
		instance.name=dict[@"name"];
	}
	else
	{
		instance.name=[NSString stringWithFormat:@"%@",dict[@"name"]];
	}
        }
    if (dict[@"pass"] && ![dict[@"pass"] isKindOfClass:[NSNull class]]) {
	if([dict[@"pass"] isKindOfClass:[NSString class]])
	{
		instance.pass=dict[@"pass"];
	}
	else
	{
		instance.pass=[NSString stringWithFormat:@"%@",dict[@"pass"]];
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
 
