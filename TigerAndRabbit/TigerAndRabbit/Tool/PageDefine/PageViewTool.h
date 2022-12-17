//
//  PageViewTool.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageViewTool : NSObject

/// 跳转到指定页面
/// - Parameter pageId: 要跳转的页面id
+(void)jumpWithPageId:(int)pageId;

/// 跳转到指定页面
/// - Parameters:
///   - pageId: 要跳转的页面id
///   - params: 跳转时携带的页面参数
+(void)jumpWithPageId:(int)pageId params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
