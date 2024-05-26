//
//  BaseNavigationControllerManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/11/27.
//

#import "BaseNavigationControllerManager.h"
#import "BaseNavigationControllerProtocol.h"

@implementation BaseNavigationControllerManager

#pragma mark -- public

+ (NSArray *)createBaseNavigationControllerArray {
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"BaseNavigationConfigPlist.plist" ofType:nil];
    NSArray *navigationViewClassNameArray = [NSArray arrayWithContentsOfFile:pathStr];
    return [self initializeBaseNavigationWithNavigationClassNameArray:navigationViewClassNameArray];
}

#pragma mark -- private

//根据配置的导航栏controller名称进行初始化
+ (NSArray *)initializeBaseNavigationWithNavigationClassNameArray:(NSArray *)navigationNameArray {
    NSMutableArray *navigationArray = [[NSMutableArray alloc] init];
    for(int i = 0 ; i < navigationNameArray.count ; i++) {
        NSString *navigationNameStr = [navigationNameArray objectAtIndex:i];
        Class navigationClass = NSClassFromString(navigationNameStr);
        if(![navigationClass respondsToSelector:@selector(shareInstance)]) {
            continue;
        }
        id navigationController = [navigationClass performSelector:@selector(shareInstance)];
        [navigationArray addObject:navigationController];
    }
    return [NSArray arrayWithArray:navigationArray];
}

@end
