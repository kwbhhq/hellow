//
//  TARBaseNavigationController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseNavigationController.h"
#import "ColorerDefine.h"

@interface TARBaseNavigationController ()

@end

@implementation TARBaseNavigationController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏不透明
    self.navigationBar.translucent = NO;
    //设置背景色，蓝
    self.navigationBar.backgroundColor = NAVIGATIONCOLOR;
    self.navigationBar.barTintColor = NAVIGATIONCOLOR;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
