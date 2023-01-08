//
//  DisplayViewProtocol.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/1.
//

#import <UIKit/UIKit.h>
@class HunXiaDataModel;

#define DisplayDescribeArray    @[@"mainStone",@"mainSkill",@"subSkill",@"awakeMainSkill",@"awakeSubSkill",@"regularHero",@"regularWork"]

#ifndef DisplayViewProtocol_h
#define DisplayViewProtocol_h

@protocol DisplayViewCellDataSource <NSObject>

@required
-(UIImage *)viewBackImage;

-(HunXiaDataModel *)getHunXiaModelWithCellIndex:(NSIndexPath *)indexPath;

@optional
-(CGFloat)backImageViewAlpha;

-(UIFont *)hunXiaNameFront;

-(NSTextAlignment)hunXiaNameAlignment;

-(CGFloat)viewCornerRadius;

-(UIFont *)describeFront;

-(UIFont *)awakeDescribeFront;

-(NSTextAlignment)describeAlignment;

-(UIColor *)awakeDescribeColor;

-(UIColor *)describeColor;

@end

@protocol ShowViewProtocol <NSObject>

-(CGFloat)getItemWidth;

@end

@protocol DisplayViewCellProtocol <NSObject>

//cell配置方法
- (void)configDisplayViewDataSource:(id<DisplayViewCellDataSource>)dataSource displayViewDelegate:(id<ShowViewProtocol>)displayViewDelegate indexPatch:(NSIndexPath *)indexPath;

@end




#endif /* DisplayViewProtocol_h */
