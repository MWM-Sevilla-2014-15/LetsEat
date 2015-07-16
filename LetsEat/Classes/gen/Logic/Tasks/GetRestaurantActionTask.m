//
//  GetRestaurantActionTask.m
//  LetsEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetRestaurantActionTask.h"
#import "LetsEatHelper.h"
#import "GetRestaurantLogic.h"

@implementation GetRestaurantActionTask

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getRestaurantActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        if (completedBlock) {
            completedBlock(statusCode, response);
        }        
    } progress:nil
    error:errorBlock];
}

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetRestaurantResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[self getRestaurantActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType) {
		if (completedBlock) {
			completedBlock(statusCode, response);
		}
	} progress: progressBlock
	error:errorBlock];
}

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getRestaurantActionTaskForRequest:request showLoadingView:YES completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getRestaurantActionTaskForRequest:request defaultCacheOptions:defaultCacheOptions showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetRestaurantLogic sharedInstance] getRestaurantAction:request defaultCacheOptions:defaultCacheOptions onSuccess:^(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType){

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

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getRestaurantActionTaskForRequest:request cache:cache refreshCache:refreshCache showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getRestaurantActionTaskForRequest:(GetRestaurantRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetRestaurantLogic sharedInstance] getRestaurantAction:request cache:cache refreshCache:refreshCache onSuccess:^(NSInteger statusCode, GetRestaurantResponseDTO *response, ServiceGeneratorCacheType cacheType){

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