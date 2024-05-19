//
//  PageViewTool.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "PageViewTool.h"
#import "BaseTabBarManager.h"

@implementation PageViewTool

#pragma mark -- public

+(void)jumpWithPageId:(int)pageId {
    [self jumpWithPageId:pageId params:nil];
}

+(void)jumpWithPageId:(int)pageId params:(nullable NSDictionary *)params {
    id viewController = [self getViewControllerWithPageId:pageId];
    if([viewController isKindOfClass:[UIViewController class]]) {
        UIViewController *jumpViewController = (UIViewController *)viewController;
        [[BaseTabBarManager shareInstance] pushToView:jumpViewController params:params];
    }
}

#pragma mark -- private

+(id)getViewControllerWithPageId:(int)pageId {
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"PageList.plist" ofType:nil];
    NSDictionary *pageViewClassNameArray = [NSDictionary dictionaryWithContentsOfFile:pathStr];
    NSString *pageClassName = [pageViewClassNameArray objectForKey:[NSString stringWithFormat:@"%d",pageId]];
    Class viewClass = NSClassFromString(pageClassName);
    return [[viewClass alloc] init];
}

@end
