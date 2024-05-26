//
//  TARBaseNavigationController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseNavigationController.h"
#import "ColorerDefine.h"
#import "SystemSize.h"

@interface TARBaseNavigationController ()

@end

@implementation TARBaseNavigationController

+ (instancetype)shareInstance {
    static TARBaseNavigationController* _instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        _instance = [[self alloc] init] ;
    }) ;
    return _instance ;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshViewStyle];
}

-(void)refreshViewStyle {
    //设置导航栏不透明
    //    self.navigationBar.translucent = NO;
    //设置背景色，蓝
    self.navigationBar.backgroundColor = NAVIGATIONCOLOR;
    self.navigationBar.barTintColor = NAVIGATIONCOLOR;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if(self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self refreshViewStyle];
    [super pushViewController:viewController animated:animated];
}

@end
