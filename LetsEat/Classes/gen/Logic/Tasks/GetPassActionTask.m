//
//  GetPassActionTask.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetPassActionTask.h"
#import "LetsGoEatHelper.h"
#import "GetPassLogic.h"

@implementation GetPassActionTask

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetPassResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getPassActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        if (completedBlock) {
            completedBlock(statusCode, response);
        }        
    } progress:nil
    error:errorBlock];
}

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetPassResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[self getPassActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType) {
		if (completedBlock) {
			completedBlock(statusCode, response);
		}
	} progress: progressBlock
	error:errorBlock];
}

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetPassResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getPassActionTaskForRequest:request showLoadingView:YES completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getPassActionTaskForRequest:request defaultCacheOptions:defaultCacheOptions showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetPassLogic sharedInstance] getPassAction:request defaultCacheOptions:defaultCacheOptions onSuccess:^(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType){

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

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getPassActionTaskForRequest:request cache:cache refreshCache:refreshCache showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getPassActionTaskForRequest:(GetPassRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetPassLogic sharedInstance] getPassAction:request cache:cache refreshCache:refreshCache onSuccess:^(NSInteger statusCode, GetPassResponseDTO *response, ServiceGeneratorCacheType cacheType){

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