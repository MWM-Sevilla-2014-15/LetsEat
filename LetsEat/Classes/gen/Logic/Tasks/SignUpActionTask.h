//
//  SignUpActionTask.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "SignUpRequestDTO.h"
#import "SignUpResponseDTO.h"
#import "SignUpLogic.h"


@interface SignUpActionTask : NSObject

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)signUpActionTaskForRequest:(SignUpRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignUpResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

@end