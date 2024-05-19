//
//  BaseViewManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import <Foundation/Foundation.h>
#import "HomeBaseViewSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

union ttr {
    int a;
};

@interface BaseViewManager : NSObject {
    int a;
}

@property(nonatomic,strong,readonly)NSArray<HomeBaseViewSectionModel *> *dataModelArray;

- (void)configData;

@end

NS_ASSUME_NONNULL_END
