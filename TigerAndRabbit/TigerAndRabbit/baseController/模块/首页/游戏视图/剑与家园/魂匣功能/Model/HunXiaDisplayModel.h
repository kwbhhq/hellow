//
//  HunXiaDisplayModel.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/2.
//

#import <Foundation/Foundation.h>
#import "DisplayViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HunXiaDisplayModel : NSObject<DisplayViewCellDataSource>

-(NSInteger)hunXiaCount;

@end

NS_ASSUME_NONNULL_END
