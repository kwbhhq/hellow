//
//  HunXiaController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "HunXiaController.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "DisplayViewCollectionViewCell.h"
#import "HunXiaDataManager.h"
#import "FilterView.h"
#import "Nsarray+SafetyArray.h"

#define COLLECTIONVIEWEDGESPACE         16
#define COLLECTIONVIEWCELLHEIGHT        96
#define CELLINTERVALSPACE               6
#define CELLROWNUM                      4

#define DISPLAYCOLLECTIONCELL   @"DisplayViewCollectionViewCell"

@interface HunXiaController ()<UICollectionViewDataSource,UICollectionViewDelegate,FilterDelegate>

@property(nonatomic,strong)UICollectionView *disPlayCollectionView;

@property(nonatomic,strong)FilterView *hunXiaFilterView;

@property(nonatomic,strong)HunXiaDataManager *hunXiaDataManager;

@end

@implementation HunXiaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"魂匣功能";
    [self createView];
    [self makeConstrains];
}

-(void)createView {
    self.view.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    [self.view addSubview:self.hunXiaFilterView];
    [self.view addSubview:self.disPlayCollectionView];
}

-(void)makeConstrains {
    [self.disPlayCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.hunXiaFilterView.mas_bottom);
    }];
    [self.hunXiaFilterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(30.0f);
    }];
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.hunXiaDataManager hunXiaCount];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DisplayViewCollectionViewCell *displayCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:DISPLAYCOLLECTIONCELL forIndexPath:indexPath];
    HunXiaDataModel *hunXiaModel = [self.hunXiaDataManager getModelAtIndex:indexPath.item];
    [displayCollectionCell configDisplayViewCell:self hunXiaModel:hunXiaModel indexPatch:indexPath];
    return displayCollectionCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *collectionCell = [collectionView cellForItemAtIndexPath:indexPath];
    DisplayViewCollectionViewCell *displayCollectionCell = (DisplayViewCollectionViewCell *)collectionCell;
    [displayCollectionCell changeBackviewAlpha];
}

#pragma mark -- FilterDelegate

-(void)updateShowView:(FilterView *)filterView showViewHeight:(CGFloat)height clickModel:(FilterModel *)clickModel {
    [self.hunXiaFilterView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(30 + height);
    }];
}

- (void)filterView:(nonnull FilterView *)filterView selectedModelArray:(NSArray *)selectedArray {
    for(int i = 0; i < selectedArray.count; i++) {
        FilterModel *model = [selectedArray safetyObjectAtIndex:i];
        [self.hunXiaDataManager filterWithType:model.filterType];
    }
    [self.disPlayCollectionView reloadData];
    
}


#pragma mark -- private

-(CGFloat)getItemWidth {
    //一行除去左右边距剩余宽度
    CGFloat lineSpace = SCREEN_WIDTH - COLLECTIONVIEWEDGESPACE * 2;
    //cell总行间距
    CGFloat rowCountDistance = (CELLROWNUM - 1) * CELLINTERVALSPACE;
    return floor((lineSpace - rowCountDistance) / CELLROWNUM);
}

#pragma mark -- lazy

- (UICollectionView *)disPlayCollectionView {
    if(!_disPlayCollectionView) {
        UICollectionViewFlowLayout *displayCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        displayCollectionViewLayout.minimumLineSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.minimumInteritemSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.sectionInset = UIEdgeInsetsMake(4, COLLECTIONVIEWEDGESPACE, 4, COLLECTIONVIEWEDGESPACE);
        displayCollectionViewLayout.itemSize = CGSizeMake([self getItemWidth], COLLECTIONVIEWCELLHEIGHT);
        _disPlayCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:displayCollectionViewLayout];
        _disPlayCollectionView.showsVerticalScrollIndicator = NO;
        _disPlayCollectionView.backgroundColor = [UIColor clearColor];
        _disPlayCollectionView.delegate = self;
        _disPlayCollectionView.dataSource = self;
        [_disPlayCollectionView registerClass:[DisplayViewCollectionViewCell class] forCellWithReuseIdentifier:DISPLAYCOLLECTIONCELL];
    }
    return _disPlayCollectionView;
}

- (FilterView *)hunXiaFilterView {
    if(!_hunXiaFilterView) {
        _hunXiaFilterView = [FilterView createFilterViewWithCacheKey:@"testss"];
        _hunXiaFilterView.delegate = self;
    }
    return _hunXiaFilterView;
}

- (HunXiaDataManager *)hunXiaDataManager {
    if(!_hunXiaDataManager) {
        _hunXiaDataManager = [[HunXiaDataManager alloc] init];
    }
    return _hunXiaDataManager;
}

@end
