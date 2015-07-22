//
//  BaseBookRestaurantLogic
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "BookRestaurantRequestDTO.h"
#import "BookRestaurantResponseDTO.h"
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

@interface BaseBookRestaurantLogic : BaseLogic


/**
* Method bookRestaurantAction: Reserva una mesa disponible de restaurante
* @param bookRestaurantRequestDTO Service request
* @returns  Service response
*/
- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode,BookRestaurantResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `bookRestaurantAction:cacheOptions:onSuccess:onError`");

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (BookRestaurantResponseDTO *)bookRestaurantActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultBookRestaurantActionCache;

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO onSuccess:(void(^)(NSInteger responseCode,BookRestaurantResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `bookRestaurantAction:cacheOptions:onSuccess:onError`");

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)bookRestaurantAction:(BookRestaurantRequestDTO *)bookRestaurantRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end