//
//  BaseSignInLogic
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "SignInRequestDTO.h"
#import "SignInResponseDTO.h"
#import "Cache.h"
#import "BaseLogic.h"

#ifndef _ModelGenLog

#ifdef SERVICE_DEBUG
 #define _ModelGenLog(...) NSLog(__VA_ARGS__)
#else
 #define _ModelGenLog(...) do { } while (0)
#endif

#endif // _ModelGenLog

#ifdef CHECK_SSL_CERTIFICATE
 #define AFNETWORKING_PIN_SSL_CERTIFICATES 1
#else
 #define AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES 1
#endif

@interface BaseSignInLogic : BaseLogic


/**
* Method signInAction: Realiza login de usuario
* @param signInRequestDTO Service request
* @returns  Service response
*/
- (void)signInAction:(SignInRequestDTO *)signInRequestDTO onSuccess:(void(^)(NSInteger responseCode,SignInResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `signInAction:cacheOptions:onSuccess:onError`");

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (SignInResponseDTO *)signInActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultSignInActionCache;

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO onSuccess:(void(^)(NSInteger responseCode,SignInResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `signInAction:cacheOptions:onSuccess:onError`");

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)signInAction:(SignInRequestDTO *)signInRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end