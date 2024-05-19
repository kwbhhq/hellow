//
//  HunXiaDataModel.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import "HunXiaDataModel.h"
#import "YYModel.h"
#import "Nsarray+SafetyArray.h"

@implementation HunXiaDataModel

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    return [self yy_modelInitWithCoder:coder];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    return [self yy_modelEncodeWithCoder:coder];
}

-(BOOL)isAwakeSkillKey:(NSString *)key {
    if(!self.isCanAwake) {
        return NO;
    }
    return [key isEqualToString:@"awakeMainSkill"] || [key isEqualToString:@"awakeSubSkill"];
}

-(NSInteger)getDisPlayFieldNum {
    int fieldNum = 0;
    if(self.regularWork.length > 0) {
        fieldNum++;
    }
    if(self.regularHero.length > 0) {
        fieldNum++;
    }
    if(self.mainStone.length > 0) {
        fieldNum++;
    }
    if(_isCanAwake) {
        //能觉醒，加俩觉醒技能
        fieldNum += 2;
    }
    //加两个基础技能
    return fieldNum + 2;
}

-(NSArray *)getDisplayKeyArray {
    NSMutableArray * allField = [NSMutableArray array];
    
    unsigned int count;
    
    objc_property_t * result = class_copyPropertyList([self class], &count);
    
    for (unsigned int index = 0; index < count; index++) {
        objc_property_t o_t =  result[index];
        NSString *fieldKey = [NSString stringWithFormat:@"%s", property_getName(o_t)];
        id fieldValue = [self valueForKey:fieldKey];
        if(![fieldValue isKindOfClass:[NSString class]]) {
            continue;
        }
        NSString *fieldStr = (NSString *)fieldValue;
        if([fieldKey isEqualToString:@"hunXiaName"] || fieldStr.length <= 0) {
            continue;
        }
        [allField addObject:fieldKey];
    }
    
    free(result);
    
    return [allField copy];
}

-(NSString *)getShowContent:(NSString *)showkey {
    NSString *modelValue = [self valueForKey:showkey];
    if([showkey isEqualToString:@"regularHero"]) {
        return [NSString stringWithFormat:@"英雄:%@",modelValue];
    }
    if([showkey isEqualToString:@"regularWork"]) {
        return [NSString stringWithFormat:@"职业:%@",modelValue];
    }
    if([showkey isEqualToString:@"awakeMainSkill"] || [showkey isEqualToString:@"awakeSubSkill"]) {
        return [NSString stringWithFormat:@"觉醒:%@",modelValue];
    }
    return modelValue;
}

@end
