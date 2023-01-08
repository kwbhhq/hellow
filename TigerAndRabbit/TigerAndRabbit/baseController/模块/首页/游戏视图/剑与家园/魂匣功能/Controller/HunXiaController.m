//
//  HunXiaController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "HunXiaController.h"
#import "DisplayView.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "DisplayViewCollectionViewCell.h"
#import "HunXiaDisplayModel.h"

#define COLLECTIONVIEWEDGESPACE         16
#define COLLECTIONVIEWCELLHEIGHT        96
#define CELLINTERVALSPACE               6

@interface HunXiaController ()

@property(nonatomic,strong)DisplayView *hunXiaDisplayView;
@property(nonatomic,strong)HunXiaDisplayModel *displayViewModel;

@end

@implementation HunXiaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"魂匣辅助功能";
    [self createView];
    [self makeConstrains];
}

-(void)createView {
    self.view.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    [self.view addSubview:self.hunXiaDisplayView];
}

-(void)makeConstrains {
    [self.hunXiaDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

#pragma mark -- lazy

- (DisplayView *)hunXiaDisplayView {
    if(!_hunXiaDisplayView) {
        _hunXiaDisplayView = [DisplayView createDisplayView:^(DisplayViewModel * _Nonnull dataModel) {
            dataModel.cellName = NSStringFromClass([DisplayViewCollectionViewCell class]);
            dataModel.cellNumber = [self.displayViewModel hunXiaCount];;
            dataModel.cellHeight = COLLECTIONVIEWCELLHEIGHT;
            dataModel.rowNum = 4;
            dataModel.rowDistance = CELLINTERVALSPACE;
            dataModel.lineDistance = CELLINTERVALSPACE;
            dataModel.collectionViewSectionInset = UIEdgeInsetsMake(0, COLLECTIONVIEWEDGESPACE, 0, COLLECTIONVIEWEDGESPACE);
            dataModel.cellDataSource = self.displayViewModel;
        }];
    }
    return _hunXiaDisplayView;
}

- (HunXiaDisplayModel *)displayViewModel {
    if(!_displayViewModel) {
        _displayViewModel = [[HunXiaDisplayModel alloc] init];
    }
    return _displayViewModel;
}

@end
