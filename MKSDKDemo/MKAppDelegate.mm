//
//  AppDelegate.m
//  XSSDKDemo
//
//  Created by 熙文 张 on 17/4/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import "MKAppDelegate.h"
#import "MKViewController.h"
#import <MKSDK/MKSDK.h>

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;
@interface MKAppDelegate ()

@end

@implementation MKAppDelegate


- (void)initSDK
{
    [[MKSDK sharedXSSDK] mkInitWithSDKParameters:1 subGameId:1 apiKey:@"4f76c696869efaa7f84afe5a2d0de332"
                                         gameKey:@"459922aa8968c4a664a988df9749bcba" trackKey:@"04e7406bd01299d05dd5528c459bb2f1" ryChannelID:@"unknown"
                                         success:^{
                                             NSLog(@"初始化成功");
                                         } failure:^(int errcode, NSString *errorMessage) {
                                             NSLog(@"初始化失败");
                                         }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MKViewController *viewController = [MKViewController new];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:viewController];
    [self.window makeKeyAndVisible];
    [self initSDK];

    return YES;
}


- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        [self initSDK];
    }
    else if (buttonIndex == 1)
    {
        exit(0);
    }
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
