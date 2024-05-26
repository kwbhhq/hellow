//
//  HunXiaDataManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import <Foundation/Foundation.h>
#import "HunXiaDataModel.h"
#import "HunXiaFilterDataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HunXiaDataManager : NSObject

- (instancetype)init;

-(HunXiaDataModel *)getModelAtIndex:(NSInteger)index;

-(NSInteger)hunXiaCount;

-(void)filterWithType:(HunXiaFilterType)type;

@end

NS_ASSUME_NONNULL_END
