//
//  HunXiaController.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "TARBaseViewController.h"

//展示视图遵循的协议
@protocol HunXiaViewProtocol <NSObject>

-(CGFloat)getItemWidth;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HunXiaController : TARBaseViewController<HunXiaViewProtocol>

@end

NS_ASSUME_NONNULL_END
