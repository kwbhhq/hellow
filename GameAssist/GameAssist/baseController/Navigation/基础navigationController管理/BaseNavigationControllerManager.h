//
//  BaseNavigationControllerManager.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/11/27.
//

#import <Foundation/Foundation.h>
#import "TARBaseNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationControllerManager : NSObject

//创建基础导航栏控制器
+ (NSArray *)createBaseNavigationControllerArray;

@end

NS_ASSUME_NONNULL_END
