//
//  HunXiaDisplayModel.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/2.
//

#import "HunXiaDisplayModel.h"
#import "HunXiaDataManager.h"
#import "UIFont+TARFontTool.h"
#import "ColorerDefine.h"

@interface HunXiaDisplayModel()

@property(nonatomic,strong)HunXiaDataManager *dataSourceManager;

@end

@implementation HunXiaDisplayModel

#pragma mark -- DisplayViewCellDataSource

-(UIImage *)viewBackImage {
    return [UIImage imageNamed:@"HunXiaImage"];
}

-(CGFloat)backImageViewAlpha {
    return 0.2;
}

-(UIFont *)hunXiaNameFront {
    return [UIFont pingFangSCSemibold:14];
}

-(UIFont *)describeFront {
    return [UIFont pingFangSCRegular:10];
}

-(UIFont *)awakeDescribeFront {
    return [UIFont pingFangSCMedium:10];
}

-(CGFloat)viewCornerRadius {
    return 8;
}

-(HunXiaDataModel *)getHunXiaModelWithCellIndex:(NSIndexPath *)indexPath {
    return [self.dataSourceManager getModelAtIndex:indexPath.item];
}

#pragma mark --  public

-(NSInteger)hunXiaCount {
    return [self.dataSourceManager hunXiaCount];
}

#pragma mark -- lazy

- (HunXiaDataManager *)dataSourceManager {
    if(!_dataSourceManager) {
        _dataSourceManager = [[HunXiaDataManager alloc] init];
    }
    return _dataSourceManager;
}

@end
