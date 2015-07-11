//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "SignInDTO.h"
#import "SignInDAO.h"

@implementation SignInDAO


// Get the shared instance and create it if necessary.
+ (SignInDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static SignInDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(SignInDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.name) {
			dict[@"name"] = instance.name;
        }
        if (instance.pass) {
			dict[@"pass"] = instance.pass;
        }
		
	

	return dict;
}

-(SignInDTO *) readFromDictionary:(NSDictionary *)dict
{
	SignInDTO *instance=[[SignInDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

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
 
