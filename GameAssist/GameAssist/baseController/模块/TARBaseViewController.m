//
//  TARBaseViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/3/13.
//

#import "TARBaseViewController.h"

@interface TARBaseViewController ()
{
    NSDictionary *_params;
}

@property(nonatomic,copy) NSDictionary *params;

@end

@implementation TARBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseViewConfig];
}

//基础视图配置
- (void)baseViewConfig {
    //配置导航栏
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //配置返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"";
    self.navigationItem.backBarButtonItem = backButton;
    //配置tableview
    if (@available(iOS 15.0, *)) {
      [UITableView appearance].sectionHeaderTopPadding = 0;
    }
}


#pragma mark -- BaseViewControllerProtocol

- (void)setParams:(NSDictionary *)params {
    _params = params;
}

#pragma mark -- lazy


- (NSDictionary *)params {
    return _params;
}
@end
