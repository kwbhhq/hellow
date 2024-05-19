//
//  Nsstring+TextStyleTool.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/9.
//

#import "Nsstring+TextStyleTool.h"

@implementation NSString(TextStyleTool)

#pragma mark ------- 计算字体长度 和 宽度 -------
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
