//
//  FilterPresent.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/14.
//

#import <Foundation/Foundation.h>
#import "DisplayViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterDisplayModel : NSObject<DisplayViewCellDataSource>

-(NSInteger)filterLabelCount;

@end

NS_ASSUME_NONNULL_END
