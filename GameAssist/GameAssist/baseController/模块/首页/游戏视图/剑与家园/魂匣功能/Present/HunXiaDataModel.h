//
//  HunXiaDataModel.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/25.
//

#import <Foundation/Foundation.h>

#define DisplayDescribeArray    @[@"mainStone",@"mainSkill",@"subSkill",@"awakeMainSkill",@"awakeSubSkill",@"regularHero",@"regularWork"]

NS_ASSUME_NONNULL_BEGIN

@interface HunXiaDataModel : NSObject<NSCoding>
@property(nonatomic,assign)BOOL isCanAwake;//是否能觉醒
@property(nonatomic,copy)NSString *hunXiaName;//魂匣名称
@property(nonatomic,copy)NSString *regularWork;//限定职业
@property(nonatomic,copy)NSString *regularHero;//限定英雄
@property(nonatomic,copy)NSString *mainStone;//主魂石
@property(nonatomic,copy)NSString *mainSkill;//主技能
@property(nonatomic,copy)NSString *subSkill;//副技能
@property(nonatomic,copy)NSString *awakeMainSkill;//觉醒主技能
@property(nonatomic,copy)NSString *awakeSubSkill;//觉醒副技能
@property(nonatomic,copy)NSArray *stoneArray;//魂石数组

//魂匣展示的字段数量
-(NSInteger)getDisPlayFieldNum;

//是否时觉醒技能字段
-(BOOL)isAwakeSkillKey:(NSString *)key;

//获取要展示的字段数组
-(NSArray *)getDisplayKeyArray;

//获取要显示的文案
-(NSString *)getShowContent:(NSString *)showkey;

@end

NS_ASSUME_NONNULL_END
