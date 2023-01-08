//
//  HunXiaDataManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "HunXiaDataManager.h"
#import "Nsarray+SafetyArray.h"
#import "YYModel.h"

@interface HunXiaDataManager()

@property(nonatomic,strong)NSMutableArray<HunXiaDataModel *> *hunXiaModelArray;

@property(nonatomic,strong)HunXiaDataModel *hunXiaModel;

@end

@implementation HunXiaDataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadLocalHunXiaData];
    }
    return self;
}

- (void)loadLocalHunXiaData {
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"HunXiaData.plist" ofType:nil];
    NSArray *tmpHunXiaArray = [NSArray arrayWithContentsOfFile:pathStr];
    for (int index = 0 ; index < tmpHunXiaArray.count ; index++) {
        id tmpHunXia = [tmpHunXiaArray safetyObjectAtIndex:index];
        if(![tmpHunXia isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        NSDictionary *hunXiaDic = (NSDictionary *)tmpHunXia;
        HunXiaDataModel *tmpHunXiaModel = [HunXiaDataModel yy_modelWithDictionary:hunXiaDic];
        [self.hunXiaModelArray safetyAddObject:tmpHunXiaModel];
    }
}

#pragma mark -- public

-(HunXiaDataModel *)getModelAtIndex:(NSInteger)index {
    return [self.hunXiaModelArray safetyObjectAtIndex:index];
}

-(NSInteger)hunXiaCount {
    return self.hunXiaModelArray.count;
}

#pragma mark -- lzay

- (NSMutableArray<HunXiaDataModel *> *)hunXiaModelArray {
    if(!_hunXiaModelArray) {
        _hunXiaModelArray = [[NSMutableArray alloc] init];
    }
    return _hunXiaModelArray;
}

@end
