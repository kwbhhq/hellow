//
//  HomeBaseViewSectionModel.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import <Foundation/Foundation.h>
#import "HomeBaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeBaseViewSectionModel : NSObject

@property(nonatomic,strong)NSArray<id<GameModelProtocol>> *gameArray;
@property(nonatomic,copy)NSString *sectionName;

@end

NS_ASSUME_NONNULL_END
