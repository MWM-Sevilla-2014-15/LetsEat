//
//  BookRestaurant.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseBookRestaurantLogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "LetsGoEatHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "BookRestaurantRequestDTO.h"
#import "BookRestaurantResponseDTO.h"
#import "BookRestaurantRequestDAO.h"
#import "BookRestaurantResponseDAO.h"
#import "BaseLogic.h"

@interface BaseBookRestaurantLogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheBookRestaurantAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheBookRestaurantAction;

@end


@implementation BaseBookRestaurantLogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[LetsGoEatHelper sharedInstance]];
    }

    return self;
}



/**
* Method bookRestaurantAction: Reserva una mesa disponible de restaurante
* @param bookRestaurantRequestDTO Service request
* @returns BookRestaurantResponseDTO Service response
*/
- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self bookRestaurantAction:bookRestaurantRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self bookRestaurantAction:bookRestaurantRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self bookRestaurantAction:bookRestaurantRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheBookRestaurantAction) {
			self.memoryCacheBookRestaurantAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheBookRestaurantAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheBookRestaurantAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"BookRestaurant/BookRestaurantAction"];
                        
            self.diskCacheBookRestaurantAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheBookRestaurantAction;
	}

	[self bookRestaurantAction:bookRestaurantRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://12-dot-com-silicon-letseat.appspot.com/rest/bookrestaurant";

	url = [self preInjectURLParameters:url  withObject:bookRestaurantRequestDTO onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];

		NSString *stringRequest=[NSString stringWithFormat:@"%@",bookRestaurantRequestDTO.request];


   	if(bookRestaurantRequestDTO.request==nil){
        url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:@""];
	} else {

		if([url rangeOfString:[NSString stringWithFormat:@"${%@}",@"request"]].location != NSNotFound) {

		    url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:stringRequest];

		}
	}

	url = [self postInjectURLParameters:url  withObject:bookRestaurantRequestDTO onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    NSDictionary *jsonDict=[[BookRestaurantRequestDAO sharedInstance] writeToDictionary:bookRestaurantRequestDTO];

    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                               options:NSJSONWritingPrettyPrinted
                                                 error:nil];

	_ModelGenLog(@"%@",[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]);

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];


    request = [self manageRequest:request onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];

    if (cache) {

    	BookRestaurantResponseDTO *cachedResponse = [cache objectForKey:bookRestaurantRequestDTO];

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
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		BookRestaurantResponseDTO *dto=[self bookRestaurantActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:bookRestaurantRequestDTO];
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

	    BookRestaurantResponseDTO *dto=[self bookRestaurantActionDTOFromOperation:operation withError:nil];

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

- (BookRestaurantResponseDTO *)bookRestaurantActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"BookRestaurant" onMethod:@"bookRestaurantAction"];

    BookRestaurantResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[BookRestaurantResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultBookRestaurantActionCache {
	
	if (self.memoryCacheBookRestaurantAction) {
    	[self.memoryCacheBookRestaurantAction removeAllObjects];
    }

    if (!self.diskCacheBookRestaurantAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"BookRestaurant/BookRestaurantAction"];
                        
        self.diskCacheBookRestaurantAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheBookRestaurantAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultBookRestaurantActionCache];

}

@end

