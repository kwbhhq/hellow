//
//  ComingSoonDataModel.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "ComingSoonDataModel.h"
#import "ColorerDefine.h"
#import <UIKit/UIKit.h>

@implementation ComingSoonDataModel

-(NSString *)gameNameTitle {
    return @"敬请期待";
}

-(NSString *)gameIconName {
    return @"MoreService";
}

-(UIColor *)backColor {
    return GAMECELLCOLOR;
}

-(NSString *)gameDescribeText {
    return @"更多功能，持续上线中";
}

@end
