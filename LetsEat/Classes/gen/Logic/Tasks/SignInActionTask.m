//
//  SignInActionTask.m
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import "SignInActionTask.h"
#import "LetsGoEatHelper.h"
#import "SignInLogic.h"

@implementation SignInActionTask

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, SignInResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self signInActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        if (completedBlock) {
            completedBlock(statusCode, response);
        }        
    } progress:nil
    error:errorBlock];
}

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, SignInResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[self signInActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType) {
		if (completedBlock) {
			completedBlock(statusCode, response);
		}
	} progress: progressBlock
	error:errorBlock];
}

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request completed:(void(^)(NSInteger statusCode,SignInResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self signInActionTaskForRequest:request showLoadingView:YES completed:completedBlock progress:nil error:errorBlock];
}

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self signInActionTaskForRequest:request defaultCacheOptions:defaultCacheOptions showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[SignInLogic sharedInstance] signInAction:request defaultCacheOptions:defaultCacheOptions onSuccess:^(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType){

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

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self signInActionTaskForRequest:request cache:cache refreshCache:refreshCache showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)signInActionTaskForRequest:(SignInRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,SignInResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[LetsGoEatHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[LetsGoEatHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[SignInLogic sharedInstance] signInAction:request cache:cache refreshCache:refreshCache onSuccess:^(NSInteger statusCode, SignInResponseDTO *response, ServiceGeneratorCacheType cacheType){

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