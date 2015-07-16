//
//  SignUp.m
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseSignUpLogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "LetsEatHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "SignUpRequestDTO.h"
#import "SignUpResponseDTO.h"
#import "SignUpRequestDAO.h"
#import "SignUpResponseDAO.h"
#import "BaseLogic.h"

@interface BaseSignUpLogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheSignUpAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheSignUpAction;

@end


@implementation BaseSignUpLogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[LetsEatHelper sharedInstance]];
    }

    return self;
}



/**
* Method signUpAction: Realiza registro de usuario
* @param signUpRequestDTO Service request
* @returns SignUpResponseDTO Service response
*/
- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self signUpAction:signUpRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self signUpAction:signUpRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self signUpAction:signUpRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheSignUpAction) {
			self.memoryCacheSignUpAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheSignUpAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheSignUpAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"SignUp/SignUpAction"];
                        
            self.diskCacheSignUpAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheSignUpAction;
	}

	[self signUpAction:signUpRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://12-dot-com-silicon-letseat.appspot.com/rest/singup";

	url = [self preInjectURLParameters:url  withObject:signUpRequestDTO onService:@"SignUp" onMethod:@"signUpAction"];

		NSString *stringRequest=[NSString stringWithFormat:@"%@",signUpRequestDTO.request];


   	if(signUpRequestDTO.request==nil){
        url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:@""];
	} else {

		if([url rangeOfString:[NSString stringWithFormat:@"${%@}",@"request"]].location != NSNotFound) {

		    url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"request"] withString:stringRequest];

		}
	}

	url = [self postInjectURLParameters:url  withObject:signUpRequestDTO onService:@"SignUp" onMethod:@"signUpAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"SignUp" onMethod:@"signUpAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    NSDictionary *jsonDict=[[SignUpRequestDAO sharedInstance] writeToDictionary:signUpRequestDTO];

    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                               options:NSJSONWritingPrettyPrinted
                                                 error:nil];

	_ModelGenLog(@"%@",[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]);

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];


    request = [self manageRequest:request onService:@"SignUp" onMethod:@"signUpAction"];

    if (cache) {

    	SignUpResponseDTO *cachedResponse = [cache objectForKey:signUpRequestDTO];

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
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"SignUp" onMethod:@"signUpAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		SignUpResponseDTO *dto=[self signUpActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:signUpRequestDTO];
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

	    SignUpResponseDTO *dto=[self signUpActionDTOFromOperation:operation withError:nil];

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

- (SignUpResponseDTO *)signUpActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"SignUp" onMethod:@"signUpAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"SignUp" onMethod:@"signUpAction"];

    SignUpResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[SignUpResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultSignUpActionCache {
	
	if (self.memoryCacheSignUpAction) {
    	[self.memoryCacheSignUpAction removeAllObjects];
    }

    if (!self.diskCacheSignUpAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"SignUp/SignUpAction"];
                        
        self.diskCacheSignUpAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheSignUpAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultSignUpActionCache];

}

@end

