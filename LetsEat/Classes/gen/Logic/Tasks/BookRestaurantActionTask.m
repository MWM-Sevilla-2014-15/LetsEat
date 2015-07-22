//
//  BookRestaurantActionTask.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BookRestaurantActionTask.h"
#import "LetsGoEatHelper.h"
#import "BookRestaurantLogic.h"

@implementation BookRestaurantActionTask

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, BookRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self bookRestaurantActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        if (completedBlock) {
            completedBlock(statusCode, response);
        }        
    } progress:nil
    error:errorBlock];
}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, BookRestaurantResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[self bookRestaurantActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
		if (completedBlock) {
			completedBlock(statusCode, response);
		}
	} progress: progressBlock
	error:errorBlock];
}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self bookRestaurantActionTaskForRequest:request showLoadingView:YES completed:completedBlock progress:nil error:errorBlock];
}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self bookRestaurantActionTaskForRequest:request defaultCacheOptions:defaultCacheOptions showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[BookRestaurantLogic sharedInstance] bookRestaurantAction:request defaultCacheOptions:defaultCacheOptions onSuccess:^(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(completedBlock){
			completedBlock(statusCode, response, cacheType);
		}

	} onProgress: progressBlock
	onError:^(NSError *error){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(errorBlock) {
			errorBlock(error);
		}
	}];

}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self bookRestaurantActionTaskForRequest:request cache:cache refreshCache:refreshCache showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)bookRestaurantActionTaskForRequest:(BookRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[BookRestaurantLogic sharedInstance] bookRestaurantAction:request cache:cache refreshCache:refreshCache onSuccess:^(NSInteger statusCode, BookRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(completedBlock){
			completedBlock(statusCode, response, cacheType);
		}

	} onProgress: progressBlock
	onError:^(NSError *error){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(errorBlock) {
			errorBlock(error);
		}
	}];

}

@end