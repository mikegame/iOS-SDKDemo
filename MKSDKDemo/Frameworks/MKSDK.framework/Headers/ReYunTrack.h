//
//  NewTtack.h
//  NewTtack
//
//  Created by yun on 16/1/11.
//  Copyright © 2016年 yun. All rights reserved.
//
#define TRACK_VERSION @"3.0.2"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/*
 热云移动广告效果监测  平台  api   请选择对应的api进行使用
 */
NS_ASSUME_NONNULL_BEGIN
@interface ReYunChannel : NSObject
//开启打印日志   正式上线包请关掉
+(void) setPrintLog :(BOOL)print;
// 开启数据统计
+ (void)initWithappKey:(NSString *)appKey withChannelId:(NSString *)channelId;
//注册成功后调用
+ (void)setRegisterWithAccountID:(NSString *)account;
//登陆成功后调用
+ (void)setLoginWithAccountID:(NSString *)account;
//开始付费时 调用（人民币单位是元）
+(void)setPaymentStart:(NSString *)transactionId paymentType:(NSString*)paymentType currentType:(NSString*)currencyType currencyAmount:(float)currencyAmount;
// 支付完成，付费分析,记录玩家充值的金额（人民币单位是元）
+(void)setPayment:(NSString *)transactionId paymentType:(NSString*)paymentType currentType:(NSString*)currencyType currencyAmount:(float)currencyAmount;
//自定义事件
+(void)setEvent:(NSString *)eventName;
//获取设备信息
+(NSString*)getDeviceId;

+(BOOL)RYApplication:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options;
@end
NS_ASSUME_NONNULL_END
