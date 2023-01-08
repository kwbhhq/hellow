//
//  DisplayView.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/1.
//

#import <UIKit/UIKit.h>
#import "DisplayViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayViewModel : NSObject

@property(nonatomic,copy)NSString *cellName;//cell名称
@property(nonatomic,assign)NSInteger cellNumber;//cell数量
@property(nonatomic,assign)NSInteger rowNum;//列数
@property(nonatomic,assign)NSInteger cellHeight;//cell高度
@property(nonatomic,assign)NSInteger rowDistance;//列间距
@property(nonatomic,assign)NSInteger lineDistance;//行间距
@property(nonatomic,assign)UIEdgeInsets collectionViewSectionInset;
@property(nonatomic,weak)id<DisplayViewCellDataSource> cellDataSource;//cell的数据源

@end

@interface DisplayView : UIView<ShowViewProtocol>

//创建展示视图
+(instancetype)createDisplayView:(void(^)(DisplayViewModel *dataModel))configBlock;

@end


NS_ASSUME_NONNULL_END
