//
//  TARBaseViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/3/13.
//

#import "TARBaseViewController.h"
#import "Masonry.h"
#import "DoraemonManager.h"
#import "TARBaseTabBarController.h"
#import "viewBControllerViewController.h"

@interface TARBaseViewController ()
@property (nonatomic, strong) UILabel *alabel;

@end

@implementation TARBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TARBaseTabBarController *baseTabBarCtrl = [[UITabBarController alloc] init];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITabBarController *mainTabBar = [[UITabBarController alloc] init];
    viewBControllerViewController *view1 = [[viewBControllerViewController alloc] init];
    view1.tabBarItem.title = @"1";
    viewBControllerViewController *view2 = [[viewBControllerViewController alloc] init];
    view2.tabBarItem.title = @"2";
    viewBControllerViewController *view3 = [[viewBControllerViewController alloc] init];
    view3.tabBarItem.title = @"3";
    [mainTabBar setViewControllers:@[view1,view2,view3]];
//    UIView *testView1 = [[UIView alloc] init];
//    testView1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testView1];
//    [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(self.view.mas_top).offset(44);
//        make.height.mas_equalTo(10);
//    }];
//
//    UIView *testView2 = [[UIView alloc] init];
//    testView2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testView2];
//    [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(testView1.mas_bottom).offset(4);
//        make.height.mas_equalTo(10);
//    }];
//
//    UIButton *testButton = [[UIButton alloc] init];
//    [self.view addSubview:testButton];
//    testButton.backgroundColor = [UIColor blueColor];
//    testButton.titleLabel.text = @"test";
//    [testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(testView2.mas_bottom).offset(4);
//        make.height.mas_equalTo(10);
//    }];
//    self.alabel = [[UILabel alloc] init];
//    self.alabel.text = @"aaaaa";
//    [self.view addSubview:self.alabel];
//    [self.alabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(testButton.mas_bottom).offset(4);
//        make.height.mas_equalTo(20);
//    }];
//}
//
//- (void)testButtonClick:(UIButton *)button {
//    viewBControllerViewController *test = [[viewBControllerViewController alloc] init];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touche) name:@"touch" object:nil];
//    [self.navigationController pushViewController:test animated:NO];
//
}

- (void)touche {
    self.alabel.text = @"bbbbb";
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"dds");

}


@end
