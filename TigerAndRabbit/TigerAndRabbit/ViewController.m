//
//  ViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/3/13.
//

#import "ViewController.h"
#import "Masonry.h"
#import "DoraemonManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *testView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    testView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView1];
    [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(44);
        make.height.mas_equalTo(10);
    }];
    
    UIView *testView2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    testView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView2];
    [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(testView1.mas_bottom).offset(4);
        make.height.mas_equalTo(10);
    }];
    
    UIButton *testButton = [[UIButton alloc] init];
    [self.view addSubview:testButton];
    testButton.backgroundColor = [UIColor blueColor];
    testButton.titleLabel.text = @"test";
    [testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchDown];
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(testView2.mas_bottom).offset(4);
        make.height.mas_equalTo(10);
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)testButtonClick:(UIButton *)button {
//    [[DoraemonManager shareInstance] click];
}


@end
