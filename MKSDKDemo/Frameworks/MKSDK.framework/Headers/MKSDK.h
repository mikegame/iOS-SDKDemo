//
//  MKSDK.h
//  MKSDK
//
//  Created by 张熙文 on 2017/5/16.
//  Copyright © 2017年 张熙文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKOrder.h"
#import "MKUser.h"
#import "MKRole.h"
#import "MKGameImageViewController.h"

//! Project version number for MKSDK.
FOUNDATION_EXPORT double MKSDKVersionNumber;

//! Project version string for MKSDK.
FOUNDATION_EXPORT const unsigned char MKSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MKSDK/PublicHeader.h>

typedef NS_ENUM(NSInteger, MKPayCode) {
    MKPayCreateOrderFail      = 1,    //创建订单失败
    MKPayDoesNotExistProduct  = 2,    //商品信息不存在
    MKPayUnknowFail           = 3,    //未知错误
    MKPayVerifyReceiptSucceed = 4,    //支付验证成功
    MKPayVerifyReceiptFail    = 5,    //支付验证失败
    MKPayURLFail              = 6     //未能连接苹果商店
};

typedef NS_ENUM(NSInteger, MKLoginSuccessSource) {
    MKLoginSuccessByLogin      = 1,    //登陆成功来源
    MKLoginSuccessByRegister   = 2,    //注册成功来源
};


typedef void (^loginSuccessBlock)(MKUser *user, MKLoginSuccessSource loginSuccessSource);
typedef void (^logoutBlock)();
typedef void (^payViewCloseBlock)();
typedef void (^createOrderBlock)(MKPayCode payCode);

@interface MKSDK : NSObject

/**
 *  游戏编号
 */
@property (nonatomic, readonly, assign) int gameId;

/**
 *  游戏渠道
 */
@property (nonatomic, readonly, assign) int subGameId;

/**
 *  游戏密钥
 */
@property (nonatomic, readonly, strong) NSString *secretKey;

/**
 *  登陆成功后当前用户信息
 */
@property (nonatomic, strong, readonly) MKUser *currUser;
@property (nonatomic, copy) loginSuccessBlock loginSuccessBlock;
@property (nonatomic, copy) logoutBlock logoutBlock;
@property (nonatomic, copy) payViewCloseBlock payViewCloseBlock;
@property (nonatomic, copy) createOrderBlock createOrderBlock;
/**
 *  获取XSSDK单例
 *
 *  @return XSSDK单例对象
 */
+ (MKSDK *)sharedXSSDK;

/**
 *  获取SDK版本号 eg:1.0.0 三段
 */
- (NSString *)mkSDKVersion;


/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param subGameId 游戏子包
 *  @param secretKey 游戏密钥
 *  @param ryAppId 热云运营ID
 *  @param ryKey 热云广告KEY
 *  @param ryChannelID 渠道ID
 */
- (void)mkInitWithSDKParameters:(int)gameId subGameId:(int)subGameId secretKey:(NSString *)secretKey
                        ryAppId:(NSString *)ryAppId ryKey:(NSString *)ryKey ryChannelID:(NSString *)ryChannelID;

/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param subGameId 游戏子包
 *  @param secretKey 游戏密钥
 *  @param oldTime 出包时间戳
 *  @param webGameUrl 游戏链接
 *  @param ryAppId 热云运营ID
 *  @param ryKey 热云广告KEY
 *  @param ryChannelID 渠道ID
 */
- (void)mkInitWithSDKParameters:(int)gameId subGameId:(int)subGameId secretKey:(NSString *)secretKey
                        oldTime:(long)oldTime
                     webGameUrl:(NSString *)webGameUrl
                   webGameImage:(NSString *)imageName
                        ryAppId:(NSString *)ryAppId ryKey:(NSString *)ryKey ryChannelID:(NSString *)ryChannelID
                        success:(void (^)(BOOL isWebGame))successBlock
                        failure:(void (^)(int errcode, NSString *errorMessage))errorBlock;

/**
 *   用户登陆
 *
 */
- (void)mkLogin;


/**
 *  支付
 *
 *  @param order    订单信息
 */
- (void)mkPay:(MKOrder *)order;


/**
 *  注销用户登陆接口
 */
- (void)mkLogout;

/**
 *  用户中心
 */
- (void)mkCenter;

/**
 *  初始化SDK
 *
 *  @param role    游戏角色
 */
- (void)mkReportRole:(MKRole *)role;


/**
 *  注销事件回调
 */
- (void)setLogoutBlock:(logoutBlock)logoutBlock;


/**
 *  登陆成功回调
 */
- (void)setLoginSuccessBlock:(loginSuccessBlock)loginSuccessBlock;

/**
 *  支付页面关闭回调
 */
- (void)setPayViewCloseBlock:(payViewCloseBlock)payViewCloseBlock;


/**
 *  IAP支付回调
 */
- (void)setCreateOrderBlock:(createOrderBlock)createOrderBlock;




- (void)mkShowFloat;


- (void)mkDissmissFloat;
@end
