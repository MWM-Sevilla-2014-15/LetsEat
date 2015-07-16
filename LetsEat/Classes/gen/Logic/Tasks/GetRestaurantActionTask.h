//
//  GetRestaurantActionTask.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetRestaurantRequestDTO.h"
#import "GetRestaurantResponseDTO.h"
#import "GetRestaurantLogic.h"


@interface GetRestaurantActionTask : NSObject

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

@end