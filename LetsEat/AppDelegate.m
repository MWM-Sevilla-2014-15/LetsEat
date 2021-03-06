//
//  AppDelegate.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//
#import "AppDelegate.h"
#import <Mint.h>
#import "UIColor+MyColor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    sleep(2);
    
    //CONFIGURAR EL COLOR DE LA NAVBAR
    [[UINavigationBar appearance] setBarTintColor:[UIColor customMainColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //CONFIGURAR EL TEXTO DE LA NAVBAR
    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      [UIColor blackColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Dosis-Regular" size:21], NSFontAttributeName,
                                      nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes: textTitleOptions];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //QUITA EL VALOR BACK Y EL TITULO DE LA NAVBAR
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    //VALORES DE LA STATUSBAR EN BLANCO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //Init SPLUNK
    [[Mint sharedInstance] initAndStartSession:@"a77620ba"];
    
    //COMPROBAR SI EXISTE USUARIO EN MEMORIA PARA DECIDIR CUAL SERA LA initCONTROLLER
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    NSString *usr = [userData objectForKey:@"User"];
    
    if (usr == nil || [usr isEqualToString:@""])
    {
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    }
    else
    {
        UIViewController* rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"mainController"];
        UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
        
        self.window.rootViewController = navigation;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
