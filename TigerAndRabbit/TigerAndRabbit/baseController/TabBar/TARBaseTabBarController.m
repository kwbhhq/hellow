//
//  TARBaseTabBarController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseTabBarController.h"
#import "BaseNavigationControllerManager.h"
#import "Masonry.h"

@implementation TARBaseTabBarController

#pragma market -- public
+ (instancetype)creteBaseTabBar {
    TARBaseTabBarController *baseTabBarController = [[TARBaseTabBarController alloc] init];
    baseTabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    [baseTabBarController setViewControllers:[BaseNavigationControllerManager createBaseNavigationControllerArray]];
    return baseTabBarController;
}

@end
