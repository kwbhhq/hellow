//
//  BaseTabBarManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "BaseTabBarManager.h"
#import "TARBaseTabBarController.h"

@interface BaseTabBarManager()<UITabBarControllerDelegate>

@property(nonatomic,strong)TARBaseTabBarController *baseTabBar;

@end

@implementation BaseTabBarManager

+ (instancetype)shareInstance {
    static BaseTabBarManager* _instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        _instance = [[BaseTabBarManager alloc] init];
    }) ;
    return _instance ;
}

#pragma mark -- public

- (TARBaseTabBarController *)creteBaseTabBar {
    TARBaseTabBarController *baseTabBarController = [[TARBaseTabBarController alloc] init];
    self.baseTabBar = baseTabBarController;
    baseTabBarController.delegate = self;
    return baseTabBarController;
}

- (void)pushToView:(UIViewController *)viewController params:(nullable NSDictionary *)params {
    if(!viewController) {
        return;
    }
    [self.baseTabBar.selectedViewController pushViewController:viewController animated:NO];
}

#pragma mark -- private

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}


@end
