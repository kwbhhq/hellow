//
//  FilterView.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/13.
//

#import <UIKit/UIKit.h>
#import "HunXiaFilterDataManager.h"
@class FilterView;

NS_ASSUME_NONNULL_BEGIN

@protocol FilterDelegate <NSObject>

-(void)filterView:(FilterView *)filterView selectedModelArray:(NSArray *)selectedArray;

-(void)updateShowView:(FilterView *)filterView showViewHeight:(CGFloat)height clickModel:(nullable FilterModel *)model;

@end


@interface FilterView : UIView

+(instancetype)createFilterViewWithCacheKey:(NSString *)cacheKey;

@property(nonatomic,weak)id<FilterDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
