//
//  HomeBaseViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/11/28.
//

#import "HomeBaseViewController.h"
#import "BaseViewManager.h"
#import "Nsarray+SafetyArray.h"
#import "HomeBaseViewSectionModel.h"
#import "HomeBaseViewCollectionCell.h"
#import "HomeBaseReusableView.h"
#import "JYJYViewController.h"
#import "PageIdDefine.h"
#import "PageViewTool.h"
#import "ColorerDefine.h"
#import "Masonry.h"

#define BASEVIEWCOLLECTIONCELL  @"BaseViewCollectionCell"
#define BASEVIEWCOLLECTIONHEADCELL  @"BaseViewCollectionHeadCell"
#define CELLINTERVALSPACE               12
#define COLLECTIONVIEWEDGESPACE         16
#define COLLECTIONVIEWHEADHEIGHT        56
#define COLLECTIONVIEWCELLHEIGHT        96

@interface HomeBaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic,strong)  BaseViewManager *viewManager;

@property (nonatomic, assign) int cellNum;


@end

@implementation HomeBaseViewController

#pragma mark -- lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的游戏";
    [self.viewManager configData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    [self.view addSubview:self.mainCollectionView];
    [self makeConstraints];
}

#pragma mark Private

- (void)makeConstraints {
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    HomeBaseViewSectionModel *sectionModel = [self.viewManager.dataModelArray safetyObjectAtIndex:section];
    return sectionModel.gameArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.viewManager.dataModelArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HomeBaseReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:BASEVIEWCOLLECTIONHEADCELL forIndexPath:indexPath];
    HomeBaseViewSectionModel *sectionModel = [self.viewManager.dataModelArray safetyObjectAtIndex:indexPath.section];
    [headView configHeadWithTitle:sectionModel.sectionName];
    return headView;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeBaseViewCollectionCell *mainCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:BASEVIEWCOLLECTIONCELL forIndexPath:indexPath];
    HomeBaseViewSectionModel *sectionModel = [self.viewManager.dataModelArray safetyObjectAtIndex:indexPath.section];
    [mainCollectionCell configGameModel:[sectionModel.gameArray safetyObjectAtIndex:indexPath.item]];
    return mainCollectionCell;
}

#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [PageViewTool jumpWithPageId:JYJY_BASE_VIEW];
}

#pragma mark -- lazy

- (UICollectionView *)mainCollectionView {
    if(!_mainCollectionView) {
        UICollectionViewFlowLayout *mainCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        mainCollectionViewLayout.minimumLineSpacing = CELLINTERVALSPACE;
        mainCollectionViewLayout.minimumInteritemSpacing = CELLINTERVALSPACE;
        mainCollectionViewLayout.sectionInset = UIEdgeInsetsMake(0, COLLECTIONVIEWEDGESPACE, 0, COLLECTIONVIEWEDGESPACE);
        mainCollectionViewLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH - COLLECTIONVIEWEDGESPACE * 2, COLLECTIONVIEWHEADHEIGHT);
        mainCollectionViewLayout.itemSize = CGSizeMake((SCREEN_WIDTH - COLLECTIONVIEWEDGESPACE * 2 - CELLINTERVALSPACE) / 2 , COLLECTIONVIEWCELLHEIGHT);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:mainCollectionViewLayout];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.backgroundColor = [UIColor clearColor];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        [_mainCollectionView registerClass:[HomeBaseViewCollectionCell class] forCellWithReuseIdentifier:BASEVIEWCOLLECTIONCELL];
        [_mainCollectionView registerClass:[HomeBaseReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:BASEVIEWCOLLECTIONHEADCELL];
        
    }
    return _mainCollectionView;
}

- (BaseViewManager *)viewManager {
    if(!_viewManager) {
        _viewManager = [[BaseViewManager alloc] init];
    }
    return _viewManager;
}

@end
