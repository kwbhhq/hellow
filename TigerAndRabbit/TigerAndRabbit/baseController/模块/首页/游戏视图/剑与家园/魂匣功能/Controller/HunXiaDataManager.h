//
//  HunXiaDataManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import <Foundation/Foundation.h>
#import "HunXiaDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HunXiaDataManager : NSObject

- (instancetype)init;

-(HunXiaDataModel *)getModelAtIndex:(NSInteger)index;

-(NSInteger)hunXiaCount;

@end

NS_ASSUME_NONNULL_END
