//
//  HunXiaDataManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "HunXiaDataManager.h"
#import "Nsarray+SafetyArray.h"
#import "YYModel.h"
#import <UIKit/UIKit.h>

#define QUANTI_SELFIDENTIFY     @"提升场上所有我方单位"
#define QUANTI_IDENTIFY     @"降低场上所有敌方单位"

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

#pragma mark -- private

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

-(NSArray *)filterQuanTi:(NSString *)a {
    return [[NSArray alloc] init];
}

#pragma mark -- public

-(HunXiaDataModel *)getModelAtIndex:(NSInteger)index {
    return [self.hunXiaModelArray safetyObjectAtIndex:index];
}

-(NSInteger)hunXiaCount {
    return self.hunXiaModelArray.count;
}

-(NSArray *)filterWithFilterModel:(FilterModel *)model {
    switch (model.filterType) {
        case HunXiaFilterType_quanTi:
            
            break;
        case HunXiaFilterType_mainStone:
            
            break;
        case HunXiaFilterType_output:
            
            break;
        case HunXiaFilterType_live:
            
            break;
        case HunXiaFilterType_more:
            
            break;
            
        default:
            break;
    }
    return self.hunXiaModelArray;
}

-(void)filterWithType:(HunXiaFilterType)type {
    switch (type) {
        case HunXiaFilterType_quanBu:
            [self loadLocalHunXiaData];
            break;
            
        case HunXiaFilterType_quanTi: {
            NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
            for(int i = 0 ; i < self.hunXiaModelArray.count ; i++) {
                HunXiaDataModel *model = [self.hunXiaModelArray safetyObjectAtIndex:i];
                if([model.mainSkill containsString:QUANTI_IDENTIFY] || [model.mainSkill containsString:QUANTI_SELFIDENTIFY]) {
                    [tmpArray safetyAddObject:model];
                }
            }
            self.hunXiaModelArray = tmpArray;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -- lzay

- (NSMutableArray<HunXiaDataModel *> *)hunXiaModelArray {
    if(!_hunXiaModelArray) {
        _hunXiaModelArray = [[NSMutableArray alloc] init];
    }
    return _hunXiaModelArray;
}

@end
