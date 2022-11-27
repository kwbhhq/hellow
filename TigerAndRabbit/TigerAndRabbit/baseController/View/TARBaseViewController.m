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

@interface TARBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UILabel *alabel;
@property (nonatomic, strong) UITableView *testTableView;
@property (nonatomic,strong) UIButton *testButton;

@property (nonatomic, assign) int cellNum;

@end

@implementation TARBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *testView1 = [[UIView alloc] init];
    testView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView1];
    [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top);
        make.height.mas_equalTo(20);
    }];


    [self.view addSubview:self.testButton];
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(testView1.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.view addSubview:self.alabel];
    [self.alabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.testButton.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    self.cellNum = 5;
    
    [self.view addSubview:self.testTableView];
    [self.testTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.alabel.mas_bottom);
        make.height.mas_equalTo(100);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
        if (!cell) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"test"];
            cell.backgroundColor = [UIColor greenColor];
      }
    cell.tag = 10 + indexPath.row;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    textField.tag = 30 + indexPath.row;
    textField.text = [NSString stringWithFormat:@"%ld",(long)textField.tag];
    [cell.contentView addSubview:textField];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cellNum -= 1;
    [self.testTableView reloadData];
}

- (void)testButtonClick:(UIButton *)button {
    UITextField *textField = [self.view viewWithTag:30 + self.cellNum];
    self.cellNum = 5;
    [_testButton setTitle:textField.text forState:UIControlStateNormal];
//    viewBControllerViewController *test = [[viewBControllerViewController alloc] init];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touche) name:@"touch" object:nil];
//    [self.navigationController pushViewController:test animated:NO];

}

- (void)touche {
    self.alabel.text = @"bbbbb";
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"dds");

}

- (UILabel *)alabel {
    if (!_alabel) {
        _alabel = [[UILabel alloc] init];
        _alabel.text = @"aaaaa";
        _alabel.font = [UIFont systemFontOfSize:18];
        _alabel.backgroundColor = [UIColor lightGrayColor];
        _alabel.textColor = [UIColor blackColor];
    }
    return _alabel;
}

- (UITableView *)testTableView {
    if (!_testTableView) {
        _testTableView = [[UITableView alloc] init];
        _testTableView.delegate = self;
        _testTableView.dataSource = self;
    }
    return _testTableView;
}

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [[UIButton alloc] init];
        [_testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _testButton.backgroundColor = [UIColor blueColor];
        _testButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_testButton setTitle:@"test" forState:UIControlStateNormal];
        [_testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}


@end
