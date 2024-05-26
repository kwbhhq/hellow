//
//  FilterCollectionViewCell.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/14.
//

#import <UIKit/UIKit.h>
#import "HunXiaFilterDataManager.h"

@protocol FilterViewCellDataSource <NSObject>

-(NSString *_Nonnull)labelName:(NSInteger)index cellTag:(NSInteger)tag;

-(BOOL)isSelected:(NSInteger)index cellTag:(NSInteger)tag;

-(BOOL)isShowSwitchImage:(NSInteger)index cellTag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_BEGIN

@interface FilterCollectionViewCell : UICollectionViewCell

- (void)refreshImageIsExpand:(BOOL)isExpand;

- (void)refreshCellColor;

- (void)configCellDataSource:(id<FilterViewCellDataSource>)dataSource indexPatch:(NSIndexPath *)indexPatch tag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
