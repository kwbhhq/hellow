//
//  BaseViewManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import "BaseViewManager.h"
#import "SwordAndHomeModel.h"
#import "ComingSoonDataModel.h"

@interface BaseViewManager()

@property(nonatomic,strong)NSArray<HomeBaseViewSectionModel *> *dataModelArray;;

@end

@implementation BaseViewManager

- (void)configData {
    HomeBaseViewSectionModel *homeSectionModel = [[HomeBaseViewSectionModel alloc] init];
    SwordAndHomeModel *gameJYJYModel = [[SwordAndHomeModel alloc] init];
    ComingSoonDataModel *willComModel = [[ComingSoonDataModel alloc] init];
    homeSectionModel.gameArray = @[gameJYJYModel,willComModel];
    homeSectionModel.sectionName = @"经营策略类";
    self.dataModelArray = @[homeSectionModel];
}

@end
