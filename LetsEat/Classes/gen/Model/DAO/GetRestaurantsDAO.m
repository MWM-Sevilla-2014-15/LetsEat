//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetRestaurantsDTO.h"
#import "GetRestaurantsDAO.h"

@implementation GetRestaurantsDAO


// Get the shared instance and create it if necessary.
+ (GetRestaurantsDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetRestaurantsDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetRestaurantsDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.isActivated) {
			dict[@"isActivated"] = instance.isActivated;
        }
        if (instance.name) {
			dict[@"name"] = instance.name;
        }
        if (instance.type) {
			dict[@"type"] = instance.type;
        }
        if (instance.url) {
			dict[@"url"] = instance.url;
        }
        if (instance.desc) {
			dict[@"desc"] = instance.desc;
        }
        if (instance.m_t_open) {
			dict[@"m_t_open"] = instance.m_t_open;
        }
        if (instance.m_t_close) {
			dict[@"m_t_close"] = instance.m_t_close;
        }
        if (instance.t_t_open) {
			dict[@"t_t_open"] = instance.t_t_open;
        }
        if (instance.t_t_close) {
			dict[@"t_t_close"] = instance.t_t_close;
        }
        if (instance.avg_price) {
			dict[@"avg_price"] = instance.avg_price;
        }
        if (instance.score) {
			dict[@"score"] = instance.score;
        }
        if (instance.totalTables) {
			dict[@"totalTables"] = instance.totalTables;
        }
        if (instance.bookTables) {
			dict[@"bookTables"] = instance.bookTables;
        }
        if (instance.lat) {
			dict[@"lat"] = instance.lat;
        }
        if (instance.lon) {
			dict[@"lon"] = instance.lon;
        }
        if (instance.prov) {
			dict[@"prov"] = instance.prov;
        }
        if (instance.telf) {
			dict[@"telf"] = instance.telf;
        }
		
	

	return dict;
}

-(GetRestaurantsDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetRestaurantsDTO *instance=[[GetRestaurantsDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"isActivated"] && ![dict[@"isActivated"] isKindOfClass:[NSNull class]]) {
	if([dict[@"isActivated"] isKindOfClass:[NSString class]])
	{
		instance.isActivated=dict[@"isActivated"];
	}
	else
	{
		instance.isActivated=[NSString stringWithFormat:@"%@",dict[@"isActivated"]];
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
    if (dict[@"type"] && ![dict[@"type"] isKindOfClass:[NSNull class]]) {
	if([dict[@"type"] isKindOfClass:[NSString class]])
	{
		instance.type=dict[@"type"];
	}
	else
	{
		instance.type=[NSString stringWithFormat:@"%@",dict[@"type"]];
	}
        }
    if (dict[@"url"] && ![dict[@"url"] isKindOfClass:[NSNull class]]) {
	if([dict[@"url"] isKindOfClass:[NSString class]])
	{
		instance.url=dict[@"url"];
	}
	else
	{
		instance.url=[NSString stringWithFormat:@"%@",dict[@"url"]];
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
    if (dict[@"m_t_open"] && ![dict[@"m_t_open"] isKindOfClass:[NSNull class]]) {
	if([dict[@"m_t_open"] isKindOfClass:[NSString class]])
	{
		instance.m_t_open=dict[@"m_t_open"];
	}
	else
	{
		instance.m_t_open=[NSString stringWithFormat:@"%@",dict[@"m_t_open"]];
	}
        }
    if (dict[@"m_t_close"] && ![dict[@"m_t_close"] isKindOfClass:[NSNull class]]) {
	if([dict[@"m_t_close"] isKindOfClass:[NSString class]])
	{
		instance.m_t_close=dict[@"m_t_close"];
	}
	else
	{
		instance.m_t_close=[NSString stringWithFormat:@"%@",dict[@"m_t_close"]];
	}
        }
    if (dict[@"t_t_open"] && ![dict[@"t_t_open"] isKindOfClass:[NSNull class]]) {
	if([dict[@"t_t_open"] isKindOfClass:[NSString class]])
	{
		instance.t_t_open=dict[@"t_t_open"];
	}
	else
	{
		instance.t_t_open=[NSString stringWithFormat:@"%@",dict[@"t_t_open"]];
	}
        }
    if (dict[@"t_t_close"] && ![dict[@"t_t_close"] isKindOfClass:[NSNull class]]) {
	if([dict[@"t_t_close"] isKindOfClass:[NSString class]])
	{
		instance.t_t_close=dict[@"t_t_close"];
	}
	else
	{
		instance.t_t_close=[NSString stringWithFormat:@"%@",dict[@"t_t_close"]];
	}
        }
    if (dict[@"avg_price"] && ![dict[@"avg_price"] isKindOfClass:[NSNull class]]) {
	if([dict[@"avg_price"] isKindOfClass:[NSString class]])
	{
		instance.avg_price=dict[@"avg_price"];
	}
	else
	{
		instance.avg_price=[NSString stringWithFormat:@"%@",dict[@"avg_price"]];
	}
        }
    if (dict[@"score"] && ![dict[@"score"] isKindOfClass:[NSNull class]]) {
	if([dict[@"score"] isKindOfClass:[NSString class]])
	{
		instance.score=dict[@"score"];
	}
	else
	{
		instance.score=[NSString stringWithFormat:@"%@",dict[@"score"]];
	}
        }
    if (dict[@"totalTables"] && ![dict[@"totalTables"] isKindOfClass:[NSNull class]]) {
		instance.totalTables = dict[@"totalTables"];
        }
    if (dict[@"bookTables"] && ![dict[@"bookTables"] isKindOfClass:[NSNull class]]) {
		instance.bookTables = dict[@"bookTables"];
        }
    if (dict[@"lat"] && ![dict[@"lat"] isKindOfClass:[NSNull class]]) {
		instance.lat = dict[@"lat"];
        }
    if (dict[@"lon"] && ![dict[@"lon"] isKindOfClass:[NSNull class]]) {
		instance.lon = dict[@"lon"];
        }
    if (dict[@"prov"] && ![dict[@"prov"] isKindOfClass:[NSNull class]]) {
	if([dict[@"prov"] isKindOfClass:[NSString class]])
	{
		instance.prov=dict[@"prov"];
	}
	else
	{
		instance.prov=[NSString stringWithFormat:@"%@",dict[@"prov"]];
	}
        }
    if (dict[@"telf"] && ![dict[@"telf"] isKindOfClass:[NSNull class]]) {
	if([dict[@"telf"] isKindOfClass:[NSString class]])
	{
		instance.telf=dict[@"telf"];
	}
	else
	{
		instance.telf=[NSString stringWithFormat:@"%@",dict[@"telf"]];
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
 
