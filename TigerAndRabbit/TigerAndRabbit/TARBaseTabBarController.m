//
//  TARBaseTabBarController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseTabBarController.h"
#import "TARBaseNavigationController.h"

@interface TARBaseTabBarController ()

@end

@implementation TARBaseTabBarController

+ (instancetype) shareInstance {
    static TARBaseTabBarController* _instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        _instance = [[self alloc] init] ;
    }) ;
    return _instance ;
}

- (TARBaseTabBarController *)getbaseTabBar {
    UIViewController *view1 = [[UIViewController alloc] init];
    view1.view.backgroundColor = [UIColor whiteColor];
    TARBaseNavigationController *nav1 = [[TARBaseNavigationController alloc] initWithRootViewController:view1];
    nav1.tabBarItem.title = @"1";
    
    UIViewController *view2 = [[UIViewController alloc] init];
    view2.view.backgroundColor = [UIColor blueColor];
    TARBaseNavigationController *nav2 = [[TARBaseNavigationController alloc] initWithRootViewController:view2];
    nav2.tabBarItem.title = @"2";
    
    UIViewController *view3 = [[UIViewController alloc] init];
    view3.view.backgroundColor = [UIColor redColor];
    TARBaseNavigationController *nav3= [[TARBaseNavigationController alloc] initWithRootViewController:view3];
    nav3.tabBarItem.title = @"3";

    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self setViewControllers:@[nav1,nav2,nav3]];
    return self;
}

@end
