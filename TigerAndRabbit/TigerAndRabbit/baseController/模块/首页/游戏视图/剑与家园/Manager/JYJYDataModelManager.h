//
//  JYJYDataModelManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import <Foundation/Foundation.h>
#import "JYJYDataSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JYJYDataModelManager : NSObject

@property(nonatomic,strong,readonly)NSArray<JYJYDataSectionModel *> *dataModelArray;

- (void)configData;

@end

NS_ASSUME_NONNULL_END
