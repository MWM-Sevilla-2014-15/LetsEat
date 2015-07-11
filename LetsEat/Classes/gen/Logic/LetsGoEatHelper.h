//
//  LetsGoEatHelper.h
//  LetsGoEat
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "LogicFilter.h"
#import "AFSecurityPolicy.h"

@interface LetsGoEatHelper : LogicFilter

// Get the shared instance and create it if necessary.
+ (LetsGoEatHelper *)sharedInstance;
- (NSString *) preInjectURLParameters:(NSString *)url withObject:(NSObject *)obj onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (NSString *) postInjectURLParameters:(NSString *)url withObject:(NSObject *)obj onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (NSString *) escapeUrl:(NSString *)url onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (NSMutableURLRequest *)manageRequest:(NSMutableURLRequest *)request onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (NSString *) preprocessResponse:(NSString *)responseString onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (NSDictionary *) preprocessResponseAsDictionary:(NSDictionary *)responseDict onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (id)preprocessCacheHitForRequest:(id)request withCachedResponse:(id)cachedResponse onService:(NSString *)serviceName onMethod:(NSString *)methodName;
- (AFSecurityPolicy *)preprocessSecurityPolicy:(AFSecurityPolicy *)securityPolicy  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod;
- (UIView *) loadingViewForTasks;
@end