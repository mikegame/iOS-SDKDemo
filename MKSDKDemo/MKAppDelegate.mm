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


@interface MKAppDelegate ()

@end

@implementation MKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    MKViewController *viewController = [MKViewController new];
    [self.window setRootViewController:viewController];
    [self.window makeKeyAndVisible];
    
    [[MKSDK sharedXSSDK] mkInitWithSDKParameters:1 subGameId:1 secretKey:@"4f76c696869efaa7f84afe5a2d0de332"
                                         ryAppId:@"459922aa8968c4a664a988df9749bcba" ryKey:@"c497a2997779e09ce454701e01b81a15" ryChannelID:@"unknown"];
    
    
    
    //    NSString *imageName = @"111";    
    //    [[MKSDK sharedXSSDK] mkInitWithSDKParameters:1 subGameId:1
    //                                       secretKey:@"4f76c696869efaa7f84afe5a2d0de332"
    //                                         oldTime:1505123978
    //                                      webGameUrl:@"http://sda.4399.com/4399swf/upload_swf/ftp19/ssj/20160701/t3/index.html"
    //                                    webGameImage:imageName
    //                                         ryAppId:@"459922aa8968c4a664a988df9749bcba" ryKey:@"c497a2997779e09ce454701e01b81a15" ryChannelID:@"unknown"
    //                                         success:^(BOOL isWebGame) {
    //                                             if (isWebGame) {
    //                                                 NSLog(@"WebGame");
    //                                                 UIImage *image = [UIImage imageNamed:imageName];
    //                                                 if (image) {
    //                                                     MKGameImageViewController *gameImageViewController = [MKGameImageViewController new];
    //                                                     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:gameImageViewController];
    //                                                     [self.window setRootViewController:navigationController];
    //                                                 }
    //                                             }
    //                                             else
    //                                             {
    //                                                 NSLog(@"NativeGame");
    //                                                 ViewController *viewController = [ViewController new];
    //                                                 [self.window setRootViewController:viewController];
    //                                             }
    //                                             [self.window makeKeyAndVisible];
    //                                         } failure:^(int errcode, NSString *errorMessage) {
    //
    //
    //    }];
    return YES;
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
