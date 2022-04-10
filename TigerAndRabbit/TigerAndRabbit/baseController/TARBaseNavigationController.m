//
//  TARBaseNavigationController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseNavigationController.h"

@interface TARBaseNavigationController ()

@end

@implementation TARBaseNavigationController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏不透明
    self.navigationBar.translucent = NO;
    //设置背景色，蓝
    self.navigationBar.backgroundColor = [[UIColor alloc] initWithRed:1.0/255.0 green:136.0/255.0 blue:251.0/255.0 alpha:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
