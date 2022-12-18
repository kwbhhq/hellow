//
//  UIFont+TARFontTool.h.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import "UIFont+TARFontTool.h"

@implementation UIFont(TARFontTool)

+(UIFont *)pingFangSCRegular:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+(UIFont *)pingFangSCMedium:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+(UIFont *)pingFangSCSemibold:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

@end
