//
//  JYJYDataModelManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import "JYJYDataModelManager.h"
#import "HunXiaModel.h"

@interface JYJYDataModelManager()

@property(nonatomic,strong)NSArray<JYJYDataSectionModel *> *dataModelArray;;

@end

@implementation JYJYDataModelManager

- (void)configData {
    JYJYDataSectionModel *jyjySectionModel = [[JYJYDataSectionModel alloc] init];
    HunXiaModel *hunXiaModel = [[HunXiaModel alloc] init];
    jyjySectionModel.supportFunctionArray = @[hunXiaModel];
    jyjySectionModel.sectionName = @"英雄";
    self.dataModelArray = @[jyjySectionModel];
}

@end
