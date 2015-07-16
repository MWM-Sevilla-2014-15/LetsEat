//
//  BaseGetRestaurantLogic
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantResponseDTO.h"
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

@interface BaseGetRestaurantLogic : BaseLogic


/**
* Method getRestaurantAction: Recoge todos los restaurantes disponibles
* @param getRestaurantRequestDTO Service request
* @returns GetRestaurantResponseDTO Service response
*/
- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetRestaurantResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getRestaurantAction:cacheOptions:onSuccess:onError`");

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (GetRestaurantResponseDTO *)getRestaurantActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultGetRestaurantActionCache;

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetRestaurantResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getRestaurantAction:cacheOptions:onSuccess:onError`");

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)getRestaurantAction:(GetRestaurantRequestDTO *)getRestaurantRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end