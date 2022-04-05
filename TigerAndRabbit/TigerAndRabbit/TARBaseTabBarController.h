//
//  TARBaseTabBarController.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TARBaseTabBarController : UITabBarController

+ (instancetype) shareInstance;

- (TARBaseTabBarController *)getbaseTabBar;

@end

NS_ASSUME_NONNULL_END
