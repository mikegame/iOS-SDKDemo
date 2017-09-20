//
//  NewGame.h
//  NewGame
//
//  Created by yun on 16/1/20.
//  Copyright © 2016年 yun. All rights reserved.
//
#define GAME_VERSION @"3.0.2"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 热云游戏运营支撑平台  api   请选择对应的api进行使用
 */
NS_ASSUME_NONNULL_BEGIN
@interface reyun : NSObject

//性别
typedef enum {
    m = 0,   //男
    f  = 1,  //女
    o = 2,   //其它
} gender;



typedef enum {
    start = 0,   //开始
    done = 1,    //结束
    fail = 2,    //失败
}questStatus;

//开启打印日志   正式上线包请关掉
+(void) setPrintLog :(BOOL)print;
// 开启数据统计
+ (void)initWithAppId:(NSString *)appId channelID:(NSString*)channelID;

//注册成功后调用（设定帐号的唯一标识)
+(void)setRegisterWithAccountID:(NSString *)account andGender:(gender)gender andage:(NSString*)age andServerId:(NSString *)serverId andAccountType:(NSString *)accountType andRole:(NSString*)roleName;
//登陆成功后调用
+(void)setLoginWithAccountID:(NSString *)accountId andGender:(gender)gender andage:(NSString*)age andServerId:(NSString *)serverId andlevel:(NSInteger)level andRole:(NSString *)roleName;

//开始支付的时候调用（人民币单位是元）
+(void)setPaymentStart:(NSString *)transactionId paymentType:(NSString*)paymentType currentType:(NSString*)currencyType currencyAmount:(float)currencyAmount virtualCoinAmount:(float)virtualCoinAmount iapName:(NSString*)iapName iapAmount:(NSInteger)iapAmount;

//支付完成的时候调用 ，付费分析,记录玩家充值的金额(人民币单位是元)
+(void)setPayment:(NSString *)transactionId paymentType:(NSString*)paymentType currentType:(NSString*)currencyType currencyAmount:(float)currencyAmount virtualCoinAmount:(float)virtualCoinAmount iapName:(NSString*)iapName iapAmount:(NSInteger)iapAmount andlevel:(NSInteger)level;

//经济系统，虚拟交易发生之后调用
+(void)setEconomy:(NSString *)itemName andEconomyNumber:(NSInteger)itemAmount andEconomyTotalPrice:(float)itemTotalPrice;

//任务分析，用户接受任务或完成任务时调用
+(void)setQuest:(NSString *)questId andTaskState:(questStatus)questStatus andTaskType:(NSString *)questType ;

//自定义事件分析
+(void)setEvent:(NSString *)eventName andExtra:(nullable NSDictionary *)extra;

//获取设备信息
+(NSString*)getDeviceId;
@end
NS_ASSUME_NONNULL_END
