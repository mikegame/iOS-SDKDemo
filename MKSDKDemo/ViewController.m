//
//  ViewController.m
//  XSSDKDemo
//
//  Created by 熙文 张 on 17/4/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import "ViewController.h"
#import <MKSDK/MKSDK.h>


@interface ViewController ()
{
    UIImageView *_bgImageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    UIImageView *bgImageView = [UIImageView new];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [bgImageView setImage:[UIImage imageNamed:@"BG1_L"]];
    }
    else
    {
        [bgImageView setImage:[UIImage imageNamed:@"BG1"]];
    }
    [bgImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:bgImageView];
    _bgImageView = bgImageView;
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"Button_Normal"];
    UIImage *buttonImageHighlighted = [UIImage imageNamed:@"Button_Highlighted"];
    UIButton *loginButton = [UIButton new];
    [loginButton setFrame:CGRectMake(140, 40, 100, 36)];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImageHighlighted forState:UIControlStateHighlighted];
    [loginButton setTitle:@"登 陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    UIButton *payButton = [UIButton new];
    [payButton setFrame:CGRectMake(140, 100, 100, 36)];
    [payButton setTitle:@"买个表" forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(payButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    
    UIButton *logOutButton = [UIButton new];
    [logOutButton setFrame:CGRectMake(140, 160, 100, 36)];
    [logOutButton setTitle:@"注 销" forState:UIControlStateNormal];
    [logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logOutButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [logOutButton addTarget:self action:@selector(logOutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logOutButton];
    
    
    UIButton *centerButton = [UIButton new];
    [centerButton setFrame:CGRectMake(140, 220, 100, 36)];
    [centerButton setTitle:@"用户中心" forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [centerButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerButton];
    
    [[MKSDK sharedXSSDK] setLogoutBlock:^{
        NSLog(@"注销事件的回调");
    }];
    
    [[MKSDK sharedXSSDK] setLoginSuccessBlock:^(MKUser *user) {
        NSString *userId    = user.userId;
        NSString *userName  = user.username;
        NSString *accessToken = user.accessToken;
        NSLog(@"userId    -- %@", userId);
        NSLog(@"userName  -- %@", userName);
        NSLog(@"accessToken     -- %@", accessToken);
    }];
    
    
}


#pragma mark --支付按钮事件--
- (void)payButtonClick
{
    MKOrder *order = [MKOrder new];
    [order setServerId:@"serverId1"];
    [order setTotalFee:1];
    [order setRoleId:@"9527"];
    [order setRoleName:@"凯特琳"];
    [order setProductName:@"未来战士"];
    [order setProductDescription:@"凯特琳皮肤"];
    [order setCpOrderId:[self getOrderStringByTime]];
    [order setCustomInfo:@"好戏开场了，想看帽子戏法吗"];
    [order setProductId:@"com.mk.mksdkdemo.1"];
    [[MKSDK sharedXSSDK] mkPay:order];
}


#pragma mark --登陆按钮事件--
- (void)loginButtonClick
{
    
    [[MKSDK sharedXSSDK] mkLogin];
}


- (void)centerButtonClick
{
    [[MKSDK sharedXSSDK] mkCenter];
}


- (void)logOutButtonClick
{
    [[MKSDK sharedXSSDK] mkLogout];
}


- (NSString *)getOrderStringByTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddhhmmssSS"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"order:%@", dateString);
    return dateString;
}



- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_bgImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        [_bgImageView setImage:[UIImage imageNamed:@"BG1"]];
    }else if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        [_bgImageView setImage:[UIImage imageNamed:@"BG1_L"]];
    }
}


@end
