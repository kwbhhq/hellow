//
//  TARBaseTabBarController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseTabBarController.h"
#import "TARBaseNavigationController.h"
#import "TARBaseViewController.h"
#import "Masonry.h"

@interface TARBaseTabBarController ()
@property (nonatomic, strong)TARBaseViewController *baseView1;

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

#pragma market -- public
- (TARBaseTabBarController *)getbaseTabBar {
    TARBaseNavigationController *nav1 = [[TARBaseNavigationController alloc] initWithRootViewController:self.baseView1];
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

- (TARBaseViewController *)baseView1 {
    if (!_baseView1) {
        _baseView1 = [[TARBaseViewController alloc] init];
        _baseView1.view.backgroundColor = [UIColor whiteColor];
    }
    return _baseView1;
}

@end
