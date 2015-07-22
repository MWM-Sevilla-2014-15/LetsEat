//
//  BaseGetPassLogic
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "GetPassRequestDTO.h"
#import "GetPassResponseDTO.h"
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

@interface BaseGetPassLogic : BaseLogic


/**
* Method getPassAction: Recupera creedenciales usuario mandandole un email
* @param getPassRequestDTO Service request
* @returns  Service response
*/
- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetPassResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getPassAction:cacheOptions:onSuccess:onError`");

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (GetPassResponseDTO *)getPassActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultGetPassActionCache;

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetPassResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getPassAction:cacheOptions:onSuccess:onError`");

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)getPassAction:(GetPassRequestDTO *)getPassRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end