//
//  BookRestaurantActionTask.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "BookRestaurantRequestDTO.h"
#import "BookRestaurantResponseDTO.h"
#import "BookRestaurantLogic.h"


@interface BookRestaurantActionTask : NSObject

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

@end