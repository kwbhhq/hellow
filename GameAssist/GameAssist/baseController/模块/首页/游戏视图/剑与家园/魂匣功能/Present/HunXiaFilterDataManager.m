//
//  HunXiaFilterDataManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/14.
//

#import "HunXiaFilterDataManager.h"
#import "Nsarray+SafetyArray.h"

@implementation FilterModel

@end

@interface HunXiaFilterDataManager()

@property(nonatomic,copy)NSArray *filterModelArray;

@end

@implementation HunXiaFilterDataManager

-(void)createBaseFilterDataWithKey:(NSString *)cacheKey {
    //读取本地数据
    id defaultData = [[NSUserDefaults standardUserDefaults] objectForKey:cacheKey];
    NSMutableDictionary *cacheDic = [[NSMutableDictionary alloc] init];
    if([defaultData isKindOfClass:[NSDictionary class]]) {
        cacheDic = [NSMutableDictionary dictionaryWithDictionary:defaultData];
    }
    
    //生成基础数据
    FilterModel *quanBuModel = [[FilterModel alloc] init];
    quanBuModel.filterName = @"全部";
    quanBuModel.filterType = HunXiaFilterType_quanBu;
    if(cacheDic.count <= 0) {
        [self.selectedModelArray safetyAddObject:quanBuModel];
    }
    
    FilterModel *quanTiModel = [[FilterModel alloc] init];
    quanTiModel.filterName = @"全体";
    quanTiModel.filterType = HunXiaFilterType_quanTi;
    if([cacheDic objectForKey:quanTiModel.filterName]) {
        [self.selectedModelArray safetyAddObject:quanTiModel];
    }
    
    FilterModel *mainStoneModel = [[FilterModel alloc] init];
    mainStoneModel.filterName = @"魂石";
    mainStoneModel.filterType = HunXiaFilterType_mainStone;
    mainStoneModel.switchArray = @[@"全部",@"一号",@"二号",@"三号",@"四号",@"五号",@"六号"];
    mainStoneModel.allSelectedIndex = 0;
    FilterModel *tmpModel = [cacheDic objectForKey:mainStoneModel.filterName];
    mainStoneModel.defaultSelected = tmpModel.defaultSelected;
    if(tmpModel.defaultSelected != 0) {
        [self.selectedModelArray safetyAddObject:mainStoneModel];
    }
    
    FilterModel *outputModel = [[FilterModel alloc] init];
    outputModel.filterName = @"输出";
    outputModel.filterType = HunXiaFilterType_mainStone;
    if([cacheDic objectForKey:outputModel.filterName]) {
        [self.selectedModelArray safetyAddObject:outputModel];
    }
    
    FilterModel *liveModel = [[FilterModel alloc] init];
    liveModel.filterName = @"生存";
    liveModel.filterType = HunXiaFilterType_live;
    if([cacheDic objectForKey:liveModel.filterName]) {
        [self.selectedModelArray safetyAddObject:liveModel];
    }
    
    FilterModel *moreModel = [[FilterModel alloc] init];
    moreModel.filterName = @"更多";
    moreModel.filterType = HunXiaFilterType_more;
    if([cacheDic objectForKey:moreModel.filterName]) {
        [self.selectedModelArray safetyAddObject:moreModel];
    }
    
    self.filterModelArray = @[quanBuModel,quanTiModel,mainStoneModel,outputModel,liveModel,moreModel];
}

//点击单选label
-(void)dealSelectedModel:(FilterModel *)model {
    FilterModel *quanTiModel = [self.filterModelArray safetyObjectAtIndex:0];
    //不是已经选中的，直接加
    if(![self.selectedModelArray containsObject:model]) {
        if([model isEqual:quanTiModel]) {
            [self.selectedModelArray removeAllObjects];
        } else {
            [self.selectedModelArray safetyRemoveObject:quanTiModel];
        }
        [self.selectedModelArray safetyAddObject:model];
        return;
    }
    //是已选中
    if (self.selectedModelArray.count == 1) {
        //只有全体时不可取消
        FilterModel *tmpModel = [self.selectedModelArray safetyObjectAtIndex:0];
        if([tmpModel isEqual:quanTiModel]) {
            return;
        }
        [self.selectedModelArray safetyRemoveObject:model];
        [self.selectedModelArray safetyAddObject:quanTiModel];
        return;
    }
    //已选中，再次点击，取消选中
    [self.selectedModelArray safetyRemoveObject:model];
}

- (NSMutableArray<FilterModel *> *)selectedModelArray {
    if(!_selectedModelArray) {
        _selectedModelArray = [[NSMutableArray alloc] init];
    }
    return _selectedModelArray;
}

@end
