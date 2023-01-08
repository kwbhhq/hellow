//
//  DisplayView.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/1.
//

#import "DisplayView.h"
#import "SystemSize.h"
#import "ColorerDefine.h"
#import "DisplayViewCollectionViewCell.h"
#import "Masonry.h"

@interface DisplayView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)DisplayViewModel *dataModel;

@property(nonatomic,strong)UICollectionView *displayCollectionView;

@end

@implementation DisplayView

+(instancetype)createDisplayView:(void(^)(DisplayViewModel *dataModel))configBlock {
    DisplayView *displayView = [[DisplayView alloc] init];
    if(configBlock) {
        configBlock(displayView.dataModel);
    }
    [displayView loadView];
    return displayView;
}

-(void)loadView {
    [self addSubview:self.displayCollectionView];
    [self makeConstrains];
}

-(void)makeConstrains {
    [self.displayCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataModel.cellNumber;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *displayCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:self.dataModel.cellName forIndexPath:indexPath];
    if([displayCollectionCell conformsToProtocol:@protocol(DisplayViewCellProtocol)]) {
        id<DisplayViewCellProtocol> displayCellObject = (id<DisplayViewCellProtocol>)displayCollectionCell;
        [displayCellObject configDisplayViewDataSource:self.dataModel.cellDataSource displayViewDelegate:self indexPatch:indexPath];
    }
    return displayCollectionCell;
}

-(CGFloat)getItemWidth {
    //一行宽度
    CGFloat lineSpace = SCREEN_WIDTH - (self.dataModel.collectionViewSectionInset.left + self.dataModel.collectionViewSectionInset.right);
    //cell之间总间距
    CGFloat rowCountDistance = (self.dataModel.rowNum - 1) * self.dataModel.rowDistance;
    return (lineSpace - rowCountDistance) / self.dataModel.rowNum;
}

#pragma mark -- lazy

- (UICollectionView *)displayCollectionView {
    if(!_displayCollectionView) {
        UICollectionViewFlowLayout *displayCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        displayCollectionViewLayout.minimumLineSpacing = self.dataModel.rowDistance;
        displayCollectionViewLayout.minimumInteritemSpacing = self.dataModel.rowDistance;
        displayCollectionViewLayout.sectionInset = self.dataModel.collectionViewSectionInset;
        displayCollectionViewLayout.itemSize = CGSizeMake([self getItemWidth], self.dataModel.cellHeight);
        _displayCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:displayCollectionViewLayout];
        _displayCollectionView.showsVerticalScrollIndicator = NO;
        _displayCollectionView.backgroundColor = [UIColor clearColor];
        _displayCollectionView.delegate = self;
        _displayCollectionView.dataSource = self;
        if(self.dataModel.cellName && NSClassFromString(self.dataModel.cellName)) {
            [_displayCollectionView registerClass:NSClassFromString(self.dataModel.cellName) forCellWithReuseIdentifier:self.dataModel.cellName];
        }
    }
    return _displayCollectionView;
}

- (DisplayViewModel *)dataModel {
    if(!_dataModel){
        _dataModel = [[DisplayViewModel alloc] init];
    }
    return _dataModel;
}

@end

@implementation DisplayViewModel


@end
