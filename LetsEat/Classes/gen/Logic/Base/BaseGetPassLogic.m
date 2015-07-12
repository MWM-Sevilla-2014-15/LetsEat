//
//  GetPass.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPassLogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "LetsGoEatHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "GetPassRequestDTO.h"
#import "GetPassResponseDTO.h"
#import "GetPassRequestDAO.h"
#import "GetPassResponseDAO.h"
#import "BaseLogic.h"

@interface BaseGetPassLogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheGetPassAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheGetPassAction;

@end


@implementation BaseGetPassLogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[LetsGoEatHelper sharedInstance]];
    }

    return self;
}



/**
* Method getPassAction: Recupera creedenciales usuario mandandole un email
* @param getPassRequestDTO Service request
* @returns GetPassResponseDTO Service response
*/
- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self getPassAction:getPassRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self getPassAction:getPassRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self getPassAction:getPassRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheGetPassAction) {
			self.memoryCacheGetPassAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheGetPassAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheGetPassAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"GetPass/GetPassAction"];
                        
            self.diskCacheGetPassAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheGetPassAction;
	}

	[self getPassAction:getPassRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://12-dot-com-silicon-letseat.appspot.com/getpass";

	url = [self preInjectURLParameters:url  withObject:getPassRequestDTO onService:@"GetPass" onMethod:@"getPassAction"];

		NSString *stringRequest=[NSString stringWithFormat:@"%@",getPassRequestDTO.request];


   	if(getPassRequestDTO.request==nil){
        url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:@""];
	} else {

		if([url rangeOfString:[NSString stringWithFormat:@"${%@}",@"request"]].location != NSNotFound) {

		    url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:stringRequest];

		}
	}

	url = [self postInjectURLParameters:url  withObject:getPassRequestDTO onService:@"GetPass" onMethod:@"getPassAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"GetPass" onMethod:@"getPassAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    NSDictionary *jsonDict=[[GetPassRequestDAO sharedInstance] writeToDictionary:getPassRequestDTO];

    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                               options:NSJSONWritingPrettyPrinted
                                                 error:nil];

	_ModelGenLog(@"%@",[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]);

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];


    request = [self manageRequest:request onService:@"GetPass" onMethod:@"getPassAction"];

    if (cache) {

    	GetPassResponseDTO *cachedResponse = [cache objectForKey:getPassRequestDTO];

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
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"GetPass" onMethod:@"getPassAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		GetPassResponseDTO *dto=[self getPassActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:getPassRequestDTO];
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

	    GetPassResponseDTO *dto=[self getPassActionDTOFromOperation:operation withError:nil];

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

- (GetPassResponseDTO *)getPassActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"GetPass" onMethod:@"getPassAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"GetPass" onMethod:@"getPassAction"];

    GetPassResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[GetPassResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultGetPassActionCache {
	
	if (self.memoryCacheGetPassAction) {
    	[self.memoryCacheGetPassAction removeAllObjects];
    }

    if (!self.diskCacheGetPassAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"GetPass/GetPassAction"];
                        
        self.diskCacheGetPassAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheGetPassAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultGetPassActionCache];

}

@end

