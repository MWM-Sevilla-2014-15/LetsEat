//
//  BaseSignUpLogic
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "SignUpRequestDTO.h"
#import "SignUpResponseDTO.h"
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

@interface BaseSignUpLogic : BaseLogic


/**
* Method signUpAction: Realiza registro de usuario
* @param signUpRequestDTO Service request
* @returns  Service response
*/
- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO onSuccess:(void(^)(NSInteger responseCode,SignUpResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `signUpAction:cacheOptions:onSuccess:onError`");

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (SignUpResponseDTO *)signUpActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultSignUpActionCache;

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO onSuccess:(void(^)(NSInteger responseCode,SignUpResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `signUpAction:cacheOptions:onSuccess:onError`");

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)signUpAction:(SignUpRequestDTO *)signUpRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end