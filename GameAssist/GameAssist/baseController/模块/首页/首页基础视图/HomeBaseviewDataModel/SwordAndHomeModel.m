//
//  SwordAndHomeModel.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import "SwordAndHomeModel.h"
#import "ColorerDefine.h"
#import <UIKit/UIKit.h>

@implementation SwordAndHomeModel

-(NSString *)gameNameTitle {
    return @"剑与家园";
}

-(NSString *)gameIconName {
    return @"JianYuJiaYuan";
}

-(UIColor *)backColor {
    return GAMECELLCOLOR;
}

-(NSString *)gameDescribeText {
    return @"和朋友一起，与世界为敌";
}

@end
