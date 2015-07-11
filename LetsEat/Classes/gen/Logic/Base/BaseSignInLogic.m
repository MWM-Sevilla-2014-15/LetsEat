//
//  SignIn.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseSignInLogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "LetsGoEatHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "SignInRequestDTO.h"
#import "SignInResponseDTO.h"
#import "SignInRequestDAO.h"
#import "SignInResponseDAO.h"
#import "BaseLogic.h"

@interface BaseSignInLogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheSignInAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheSignInAction;

@end


@implementation BaseSignInLogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[LetsGoEatHelper sharedInstance]];
    }

    return self;
}



/**
* Method signInAction: Realiza login de usuario
* @param signInRequestDTO Service request
* @returns SignInResponseDTO Service response
*/
- (void)signInAction:(SignInRequestDTO *)signInRequestDTO onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self signInAction:signInRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self signInAction:signInRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self signInAction:signInRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheSignInAction) {
			self.memoryCacheSignInAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheSignInAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheSignInAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"SignIn/SignInAction"];
                        
            self.diskCacheSignInAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheSignInAction;
	}

	[self signInAction:signInRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://12-dot-com-silicon-letseat.appspot.com/singin";

	url = [self preInjectURLParameters:url  withObject:signInRequestDTO onService:@"SignIn" onMethod:@"signInAction"];

		NSString *stringRequest=[NSString stringWithFormat:@"%@",signInRequestDTO.request];


   	if(signInRequestDTO.request==nil){
        url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:@""];
	} else {

		if([url rangeOfString:[NSString stringWithFormat:@"${%@}",@"request"]].location != NSNotFound) {

		    url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:stringRequest];

		}
	}

	url = [self postInjectURLParameters:url  withObject:signInRequestDTO onService:@"SignIn" onMethod:@"signInAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"SignIn" onMethod:@"signInAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    NSDictionary *jsonDict=[[SignInRequestDAO sharedInstance] writeToDictionary:signInRequestDTO];

    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                               options:NSJSONWritingPrettyPrinted
                                                 error:nil];

	_ModelGenLog(@"%@",[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]);

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];


    request = [self manageRequest:request onService:@"SignIn" onMethod:@"signInAction"];

    if (cache) {

    	SignInResponseDTO *cachedResponse = [cache objectForKey:signInRequestDTO];

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
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"SignIn" onMethod:@"signInAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		SignInResponseDTO *dto=[self signInActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:signInRequestDTO];
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

	    SignInResponseDTO *dto=[self signInActionDTOFromOperation:operation withError:nil];

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

- (SignInResponseDTO *)signInActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"SignIn" onMethod:@"signInAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"SignIn" onMethod:@"signInAction"];

    SignInResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[SignInResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultSignInActionCache {
	
	if (self.memoryCacheSignInAction) {
    	[self.memoryCacheSignInAction removeAllObjects];
    }

    if (!self.diskCacheSignInAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"SignIn/SignInAction"];
                        
        self.diskCacheSignInAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheSignInAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultSignInActionCache];

}

@end

