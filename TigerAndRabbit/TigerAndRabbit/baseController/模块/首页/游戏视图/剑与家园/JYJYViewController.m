//
//  JYJYViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "JYJYViewController.h"
#import "ColorerDefine.h"
#import "Masonry.h"
#import "JYJYDataModelManager.h"
#import "Nsarray+SafetyArray.h"
#import "JYJYSupportFuncCell.h"
#import "JYJYSupportFuncHeadView.h"
#import "PageViewTool.h"

#define JYJYSUPPORTFUNCCELL     @"JYJYSupportFuncCell"
#define JYJYSUPPORTFUNHEADVIEW     @"JYJYSupportFuncHeadView"
#define CELLHEIGHT              44

@interface JYJYViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)JYJYDataModelManager *tableViewManager;

@property(nonatomic,strong)UITableView *functionTableview;

@end

@implementation JYJYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"剑与家园";
    [self.tableViewManager configData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self createView];
}

- (void)createView {
    self.view.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    [self.view addSubview:self.functionTableview];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.functionTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableViewManager.dataModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JYJYDataSectionModel *sectionModel = [self.tableViewManager.dataModelArray safetyObjectAtIndex:section];
    return sectionModel.supportFunctionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JYJYSupportFuncCell *functionCell = [tableView dequeueReusableCellWithIdentifier:JYJYSUPPORTFUNCCELL forIndexPath:indexPath];
    functionCell.selectionStyle = UITableViewCellSelectionStyleNone;

    JYJYDataSectionModel *sectionModel = [self.tableViewManager.dataModelArray safetyObjectAtIndex:indexPath.section];
    BOOL isLastCell = sectionModel.supportFunctionArray.count == indexPath.item + 1;
    id<JYJYDataModelProtocol> cellModel = [sectionModel.supportFunctionArray safetyObjectAtIndex:indexPath.item];
    [functionCell configFunctionModel:cellModel isLastCell:isLastCell];
    return functionCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JYJYSupportFuncHeadView *functionheadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:JYJYSUPPORTFUNHEADVIEW];
    if(!functionheadView) {
        functionheadView = [[JYJYSupportFuncHeadView alloc] init];
    }
    JYJYDataSectionModel *sectionModel = [self.tableViewManager.dataModelArray safetyObjectAtIndex:section];
    [functionheadView configHeadWithTitle:sectionModel.sectionName];
    return functionheadView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CELLHEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [PageViewTool jumpWithPageId:HX_BASEE_VIEW];
}

#pragma mark -- lazy

- (UITableView *)functionTableview {
    if(!_functionTableview) {
        _functionTableview = [[UITableView alloc] init];
        _functionTableview.backgroundColor = [UIColor clearColor];
        _functionTableview.delegate = self;
        _functionTableview.dataSource = self;
        _functionTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_functionTableview registerClass:[JYJYSupportFuncCell class] forCellReuseIdentifier:JYJYSUPPORTFUNCCELL];
        [_functionTableview registerClass:[JYJYSupportFuncHeadView class] forHeaderFooterViewReuseIdentifier:JYJYSUPPORTFUNHEADVIEW];
    }
    return _functionTableview;
}

- (JYJYDataModelManager *)tableViewManager {
    if(!_tableViewManager) {
        _tableViewManager = [[JYJYDataModelManager alloc] init];
    }
    return _tableViewManager;
}

@end
