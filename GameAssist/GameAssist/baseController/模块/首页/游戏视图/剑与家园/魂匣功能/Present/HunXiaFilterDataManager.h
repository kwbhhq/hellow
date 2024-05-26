//
//  HunXiaFilterDataManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HunXiaFilterType) {
    HunXiaFilterType_quanBu = 0,        //全部魂匣
    HunXiaFilterType_quanTi = 1,        //加全体
    HunXiaFilterType_mainStone = 2,     //稀有魂匣
    HunXiaFilterType_output = 3,        //输出
    HunXiaFilterType_live = 4,          //生存
    HunXiaFilterType_more = 5           //更多
};

NS_ASSUME_NONNULL_BEGIN

@interface FilterModel : NSObject

@property(nonatomic,assign)HunXiaFilterType filterType;

@property(nonatomic,copy)NSString *filterName;

@property(nonatomic,copy)NSArray *switchArray;

@property(nonatomic,assign)NSInteger defaultSelected;

@property(nonatomic,assign)NSInteger allSelectedIndex;

@end


@interface HunXiaFilterDataManager : NSObject

@property(nonatomic,copy,readonly)NSArray<FilterModel *> *filterModelArray;

@property(nonatomic,strong)NSMutableArray<FilterModel *> *selectedModelArray;

-(void)createBaseFilterDataWithKey:(NSString *)cacheKey;

-(void)dealSelectedModel:(FilterModel *)model;

@end

NS_ASSUME_NONNULL_END
