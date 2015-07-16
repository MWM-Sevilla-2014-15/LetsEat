//
//  GetRestaurant.m
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetRestaurantLogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "LetsEatHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantResponseDTO.h"
#import "GetRestaurantRequestDAO.h"
#import "GetRestaurantResponseDAO.h"
#import "BaseLogic.h"

@interface BaseGetRestaurantLogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheGetRestaurantAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheGetRestaurantAction;

@end


@implementation BaseGetRestaurantLogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[LetsEatHelper sharedInstance]];
    }

    return self;
}



/**
* Method getRestaurantAction: Recoge todos los restaurantes disponibles
* @param getRestaurantRequestDTO Service request
* @returns GetRestaurantResponseDTO Service response
*/
- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self getRestaurantAction:getRestaurantRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self getRestaurantAction:getRestaurantRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self getRestaurantAction:getRestaurantRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheGetRestaurantAction) {
			self.memoryCacheGetRestaurantAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheGetRestaurantAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheGetRestaurantAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"GetRestaurant/GetRestaurantAction"];
                        
            self.diskCacheGetRestaurantAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheGetRestaurantAction;
	}

	[self getRestaurantAction:getRestaurantRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://12-dot-com-silicon-letseat.appspot.com/rest/getrestaurants";

	url = [self preInjectURLParameters:url  withObject:getRestaurantRequestDTO onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];




	url = [self postInjectURLParameters:url  withObject:getRestaurantRequestDTO onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    NSDictionary *jsonDict=[[GetRestaurantRequestDAO sharedInstance] writeToDictionary:getRestaurantRequestDTO];

    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                               options:NSJSONWritingPrettyPrinted
                                                 error:nil];

	_ModelGenLog(@"%@",[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]);

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];


    request = [self manageRequest:request onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];

    if (cache) {

    	GetRestaurantResponseDTO *cachedResponse = [cache objectForKey:getRestaurantRequestDTO];

    	if (cachedResponse) {
    		
    		onSuccess(200, cachedResponse, ServiceGeneratorCacheTypeUnknown);

    		if (!refreshCache) {
    			return;
    		}
    	}
    	
    }

	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];

	if ([operation respondsToSelector:@selector(setSecurityPolicy:)]) {

		AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
		securityPolicy.allowInvalidCertificates = YES;
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		GetRestaurantResponseDTO *dto=[self getRestaurantActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:getRestaurantRequestDTO];
			}

	        if (onSuccess) {	        	
	            onSuccess(operation.response.statusCode, dto, ServiceGeneratorCacheTypeNone);
	        }

	  	} else {

			if (onError) {
				onError(error);
			}
		}

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {

	    GetRestaurantResponseDTO *dto=[self getRestaurantActionDTOFromOperation:operation withError:nil];

		if (dto) {

	        if (onSuccess) {
	            onSuccess(operation.response.statusCode, dto, ServiceGeneratorCacheTypeNone);
	        }

		} else if (onError) {
			onError(error);
		}
	}];

	[operation start];
}

- (GetRestaurantResponseDTO *)getRestaurantActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"GetRestaurant" onMethod:@"getRestaurantAction"];

    GetRestaurantResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[GetRestaurantResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultGetRestaurantActionCache {
	
	if (self.memoryCacheGetRestaurantAction) {
    	[self.memoryCacheGetRestaurantAction removeAllObjects];
    }

    if (!self.diskCacheGetRestaurantAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"GetRestaurant/GetRestaurantAction"];
                        
        self.diskCacheGetRestaurantAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheGetRestaurantAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultGetRestaurantActionCache];

}

@end

