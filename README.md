# 米壳游戏iOS SDK客户端说明文档
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/mikegame/iOS-SDKDemo/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;


演示项目
==============
查看并运行 `MKSDKDemo/MKSDKDemo.xcodeproj`


使用
==============


1. 下载 MKSDKDemo 文件夹内的所有内容。<br/>
<img src="https://github.com/mikegame/iOS-SDKDemo/blob/master/Snapshots/FrameworkPath.png"><br/>
2. 将 Frameworks 内的MKSDK.framework和MKSDK.xcassets添加(拖放)到你的工程目录中。
<img src="https://github.com/mikegame/iOS-SDKDemo/blob/master/Snapshots/Framework.png"><br/>
3. 在对应项目Targets下找到General。<br/>
   在Deployment Info根据游戏需要，自行限制横屏还是竖屏。并且在AppDelegate入口限制方向<br/>
   ```
   - (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
   {
       return UIInterfaceOrientationMaskPortrait;
   }
   ```
   勾选 Hide status bar 和requires full screen
   并且在Embedded Binaries和Linked Frameworks and Libraries链接 frameworks:
<img src="https://github.com/mikegame/iOS-SDKDemo/blob/master/Snapshots/FrameworkLink.png"><br/>

5. 导入 `<MKSDK/MKSDK.h>`。
```
#import <MKSDK/MKSDK.h>
```
5. 初始化SDK。并更改对应的参数

#### 初始化SDK `初始化方法要写在[self.window makeKeyAndVisible]方法之后`

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[MKSDK sharedXSSDK] mkInitWithSDKParameters:1 subGameId:1secretKey:@"4f76c696869efaa7f84afe5a2d0de332"
    ryAppId:@"459922aa8968c4a664a988df9749bcba" ryKey:@"c497a2997779e09ce454701e01b81a15" ryChannelID:@"unknown"
    success:^{
    
    } failure:^(int errcode, NSString *errorMessage) {

    }];
    return YES;
}
```

#### 获取SDK版本号

```objective-c
[[MKSDK sharedXSSDK] mkSDKVersion];
```

#### 登陆方法

```objective-c
- (void)loginButtonClick
{
    [[MKSDK sharedXSSDK] mkLogin];
}
```

#### 支付方法

```objective-c
- (void)payButtonClick
{
    MKOrder *order = [MKOrder new];
    [order setServerId:@"serverId1"];
    [order setTotalFee:1];
    [order setRoleId:@"9527"];
    [order setRoleName:@"凯特琳"];
    [order setProductName:@"未来战士"];
    [order setProductDescription:@"凯特琳皮肤"];
    [order setCoOrderId:[self getOrderStringByTime]];
    [order setCustomInfo:@"好戏开场了，想看帽子戏法吗"];
    [order setProductId:@"com.mk.mksdkdemo.1"];
    [[MKSDK sharedXSSDK] mkPay:order];
}
```

#### 登陆成功回调方法

```objective-c
[[MKSDK sharedXSSDK] setLoginSuccessBlock:^(MKUser *user) {
    NSString *userId    = user.userId;
    NSString *userName  = user.username;
    NSString *accessToken = user.accessToken;
    NSLog(@"userId    -- %@", userId);
    NSLog(@"userName  -- %@", userName);
    NSLog(@"accessToken     -- %@", accessToken);

    if (loginSuccessSource == MKLoginSuccessByLogin) {
    NSLog(@"登陆来源");
    }
    else if (loginSuccessSource == MKLoginSuccessByRegister)
    {
    NSLog(@"注册来源");
    }

    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:date];


    MKRole *role = [MKRole new];
    [role setServerId:@"serverId1"];
    [role setServerName:@"紫陌红尘"];
    [role setRoleId:@"9527"];
    [role setRoleName:@"凯特琳"];
    [role setRoleLevel:1];
    [role setLoginTime:dateTime];
    [[MKSDK sharedXSSDK] mkReportRole:role];
    
}];
```


#### 用户注销回调方法

```objective-c
[[MKSDK sharedXSSDK] setLogoutBlock:^{
    NSLog(@"注销事件的回调");
}];
```


#### 用户关闭支付页面回调方法
```objective-c
[[MKSDK sharedXSSDK] setPayViewCloseBlock:^{
    NSLog(@"支付页面关闭的回调");
}];
```

#### IAP支付回调方法
```objective-c
[[MKSDK sharedXSSDK] setCreateOrderBlock:^(MKPayCode payCode) {
    NSLog(@"IAP支付回调 - %ld", payCode);
}];
```


注意
==============
1、项目编译build Settings 的Base SDK选当前最新的版本。至少iOS11以上。不然会出现一些比较奇怪的问题。


系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 7.0`。



许可证
==============
MKSDK 使用 MIT 许可证，详情见 LICENSE 文件。
