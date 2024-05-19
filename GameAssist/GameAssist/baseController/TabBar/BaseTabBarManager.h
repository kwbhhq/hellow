//
//  BaseTabBarManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import <Foundation/Foundation.h>
#import "TARBaseTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarManager : NSObject

+ (instancetype)shareInstance;

/// 创建基础TabBar
- (TARBaseTabBarController *)creteBaseTabBar;

/// 跳转到指定页面
///  - viewController: 要跳转的controller
///  - params: 跳转参数
- (void)pushToView:(UIViewController *)viewController params:(nullable NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
