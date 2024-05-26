//
//  FilterView.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/13.
//

#import "FilterView.h"
#import "Masonry.h"
#import "SystemSize.h"
#import "ColorerDefine.h"
#import "FilterCollectionViewCell.h"
#import "Nsarray+SafetyArray.h"
#import "HunXiaFilterDataManager.h"

#define CELLINTERVALSPACE               8
#define COLLECTIONVIEWCELLHEIGHT        18
#define CELLROWNUM                      5

#define FILTERTAG                       50
#define SHOWTAG                         40

#define FILTERCOLLECTIONVIEWCELL @"FilterCollectionViewCell"

@interface FilterView()<UICollectionViewDataSource,UICollectionViewDelegate,FilterViewCellDataSource>

@property(nonatomic,strong)UICollectionView *filterCollectionView;

@property(nonatomic,strong)HunXiaFilterDataManager *fileterDataManager;

@property(nonatomic,strong)FilterModel *expandModel;

@property(nonatomic,strong)UIView *lineView;

@property(nonatomic,strong)NSMutableDictionary *selectedArray;

@property(nonatomic,strong)UICollectionView *showCollectionView;

@end

@implementation FilterView

+(instancetype)createFilterViewWithCacheKey:(NSString *)cacheKey {
    FilterView *filterView = [[FilterView alloc] init];
    [filterView createView];
    //读取本地数据
    [filterView.fileterDataManager createBaseFilterDataWithKey:cacheKey];
    return filterView;
}

-(void)createView {
    self.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    [self addSubview:self.filterCollectionView];
    [self addSubview:self.lineView];
    [self.filterCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(self.filterCollectionView.mas_bottom);
    }];
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(collectionView.tag == SHOWTAG) {
        return self.expandModel.switchArray.count;
    }
    return self.fileterDataManager.filterModelArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterCollectionViewCell *filterCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:FILTERCOLLECTIONVIEWCELL forIndexPath:indexPath];
    [filterCollectionCell configCellDataSource:self indexPatch:indexPath tag:collectionView.tag];
    return filterCollectionCell;
}

#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //无论点击哪个，在展示视图展开时，再次点击收起
    if(collectionView.tag == FILTERTAG) {
        [self dealFilterClickIndex:indexPath collectionView:collectionView];
    }else if (collectionView.tag == SHOWTAG) {
        [self dealShowClickIndex:indexPath collectionView:collectionView];
    }
}

-(NSString *_Nonnull)labelName:(NSInteger)index cellTag:(NSInteger)tag {
    if(tag == FILTERTAG) {
        FilterModel *model = [self.fileterDataManager.filterModelArray safetyObjectAtIndex:index];
        return model.filterName;
    }
    NSString *name = [self.expandModel.switchArray safetyObjectAtIndex:index];
    return name;
}

-(BOOL)isSelected:(NSInteger)index cellTag:(NSInteger)tag {
    if(tag == FILTERTAG) {
        FilterModel *model = [self.fileterDataManager.filterModelArray safetyObjectAtIndex:index];
        return [self.fileterDataManager.selectedModelArray containsObject:model];
    }
    return self.expandModel.defaultSelected == index;
}

-(BOOL)isShowSwitchImage:(NSInteger)index cellTag:(NSInteger)tag {
    if(tag != FILTERTAG) {
        return NO;
    }
    FilterModel *model = [self.fileterDataManager.filterModelArray safetyObjectAtIndex:index];
    return model.switchArray.count > 0;
}

#pragma mark -- public

#pragma mark -- private

-(void)dealFilterClickIndex:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    FilterCollectionViewCell *cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    FilterModel *model = [self.fileterDataManager.filterModelArray objectAtIndex:indexPath.item];
    //已展开，点击其他筛选按钮时收起选择视图
    if(_showCollectionView) {
        [self closeShowView];
        [cell refreshImageIsExpand:NO];
        return;
    }
    //点击可多选label
    if(model.switchArray.count > 0 ) {
        self.expandModel = model;
        [cell refreshImageIsExpand:YES];
        [self expandShowViewWithModel:model];
        return;
    }
    //点击单选label
    [self.fileterDataManager dealSelectedModel:model];
    [self.filterCollectionView reloadData];
    if([self.delegate respondsToSelector:@selector(filterView:selectedModelArray:)]) {
        [self.delegate filterView:self selectedModelArray:self.fileterDataManager.selectedModelArray];
    }
}

-(void)dealShowClickIndex:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    FilterCollectionViewCell *cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //获取上一个选中的cell
    NSIndexPath *oldIndex = [NSIndexPath indexPathForRow:self.expandModel.defaultSelected inSection:0];
    FilterCollectionViewCell *oldCell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:oldIndex];

    //设置选中的cell
    if(self.expandModel.defaultSelected != indexPath.item) {
        self.expandModel.defaultSelected = indexPath.item;
    } else {
        self.expandModel.defaultSelected = 0;
    }
    [cell refreshCellColor];
    [oldCell refreshCellColor];
    //选全部时刷新
    if(self.expandModel.defaultSelected == self.expandModel.allSelectedIndex) {
        NSIndexPath *selectedAllIndex = [NSIndexPath indexPathForRow:self.expandModel.allSelectedIndex inSection:0];
        FilterCollectionViewCell *selectedAllCell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectedAllIndex];
        //选择默认的，从已选中移除
        [self.fileterDataManager.selectedModelArray safetyRemoveObject:self.expandModel];
        [selectedAllCell refreshCellColor];
    } else if(![self.fileterDataManager.selectedModelArray containsObject:self.expandModel]) {
        [self.fileterDataManager.selectedModelArray safetyAddObject:self.expandModel];
    }
    //刷新展开cell
    NSInteger expandIndex = [self.fileterDataManager.filterModelArray indexOfObject:self.expandModel];
    NSIndexPath *expandIndexPath = [NSIndexPath indexPathForRow:expandIndex inSection:0];
    FilterCollectionViewCell *expandCell = (FilterCollectionViewCell *)[self.filterCollectionView cellForItemAtIndexPath:expandIndexPath];
    [expandCell refreshCellColor];
    //执行代理
    if([self.delegate respondsToSelector:@selector(filterView:selectedModelArray:)]) {
        [self.delegate filterView:self selectedModelArray:self.fileterDataManager.selectedModelArray];
    }
}

-(CGFloat)getItemWidth {
    //一行除去左右边距剩余宽度
    CGFloat lineSpace = SCREEN_WIDTH - CELLINTERVALSPACE * 2;
    //cell总行间距
    CGFloat rowCountDistance = (CELLROWNUM - 1) * CELLINTERVALSPACE;
    return floor((lineSpace - rowCountDistance) / CELLROWNUM);
}

//获取选择视图高度
-(CGFloat)getShowViewHeight:(FilterModel *)model {
    //行数
    CGFloat lineNum = model.switchArray.count / 5;
    if(model.switchArray.count % 5 > 0) {
        lineNum++;
    }
    //section顶部距离8 底部4
    return 8 + COLLECTIONVIEWCELLHEIGHT * lineNum + (lineNum - 1) * CELLINTERVALSPACE + 4;
}

-(void)closeShowView {
    if(!_showCollectionView) {
        return;
    }
    [self.filterCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    //更新视图总高度
    if([self.delegate respondsToSelector:@selector(updateShowView:showViewHeight:clickModel:)]) {
        [self.delegate updateShowView:self showViewHeight:0 clickModel:nil];
    }
    self.expandModel = nil;
    [_showCollectionView removeFromSuperview];
    _showCollectionView = nil;
}

//展开选择视图
-(void)expandShowViewWithModel:(FilterModel *)model {
    //添加展示视图
    [self addSubview:self.showCollectionView];
    CGFloat viewHeight = [self getShowViewHeight:model];
    //更新视图总高度
    if([self.delegate respondsToSelector:@selector(updateShowView:showViewHeight:clickModel:)]) {
        [self.delegate updateShowView:self showViewHeight:viewHeight clickModel:model];
    }
    [self.showCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.filterCollectionView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(viewHeight);
    }];
    [self.filterCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [self.showCollectionView reloadData];
}

#pragma mark -- lazy

- (UICollectionView *)filterCollectionView {
    if(!_filterCollectionView) {
        UICollectionViewFlowLayout *displayCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        displayCollectionViewLayout.minimumLineSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.minimumInteritemSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.sectionInset = UIEdgeInsetsMake(8, 8, 4, 8);
        displayCollectionViewLayout.itemSize = CGSizeMake([self getItemWidth], COLLECTIONVIEWCELLHEIGHT);
        _filterCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:displayCollectionViewLayout];
        _filterCollectionView.showsVerticalScrollIndicator = NO;
        _filterCollectionView.backgroundColor = [UIColor clearColor];
        _filterCollectionView.delegate = self;
        _filterCollectionView.dataSource = self;
        _filterCollectionView.tag = FILTERTAG;
        [_filterCollectionView registerClass:[FilterCollectionViewCell class] forCellWithReuseIdentifier:FILTERCOLLECTIONVIEWCELL];
    }
    return _filterCollectionView;
}

- (UICollectionView *)showCollectionView {
    if(!_showCollectionView) {
        UICollectionViewFlowLayout *displayCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        displayCollectionViewLayout.minimumLineSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.minimumInteritemSpacing = CELLINTERVALSPACE;
        displayCollectionViewLayout.sectionInset = UIEdgeInsetsMake(8, 8, 4, 8);
        displayCollectionViewLayout.itemSize = CGSizeMake([self getItemWidth], COLLECTIONVIEWCELLHEIGHT);
        _showCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:displayCollectionViewLayout];
        _showCollectionView.showsVerticalScrollIndicator = NO;
        _showCollectionView.backgroundColor = [UIColor clearColor];
        _showCollectionView.delegate = self;
        _showCollectionView.dataSource = self;
        _showCollectionView.tag = SHOWTAG;
        [_showCollectionView registerClass:[FilterCollectionViewCell class] forCellWithReuseIdentifier:FILTERCOLLECTIONVIEWCELL];
    }
    return _showCollectionView;
}

- (HunXiaFilterDataManager *)fileterDataManager {
    if(!_fileterDataManager) {
        _fileterDataManager = [[HunXiaFilterDataManager alloc] init];
    }
    return _fileterDataManager;
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = DIVIDE_DEEPCOLOR;
    }
    return _lineView;
}

@end
