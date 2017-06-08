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

//! Project version number for MKSDK.
FOUNDATION_EXPORT double MKSDKVersionNumber;

//! Project version string for MKSDK.
FOUNDATION_EXPORT const unsigned char MKSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MKSDK/PublicHeader.h>

typedef void (^loginSuccessBlock)(MKUser *user);
typedef void (^logoutBlock)();


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

/**
 *  获取XSSDK单例
 *
 *  @return XSSDK单例对象
 */
+ (MKSDK *)sharedXSSDK;



/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param subGameId 游戏子包
 *  @param secretKey 游戏密钥
 */
- (void)mkInitWithSDKParameters:(int)gameId subGameId:(int)subGameId secretKey:(NSString *)secretKey;


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
 *  注销事件回调
 */
- (void)setLogoutBlock:(logoutBlock)logoutBlock;


- (void)mkCenter;

- (void)setLoginSuccessBlock:(loginSuccessBlock)loginSuccessBlock;
@end
