//
//  DisplayViewCollectionViewCell.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/1.
//

#import <UIKit/UIKit.h>
#import "HunXiaController.h"
#import "HunXiaDataModel.h"

extern const int intervalDistance;

NS_ASSUME_NONNULL_BEGIN

@interface DisplayViewCollectionViewCell : UICollectionViewCell

- (void)configDisplayViewCell:(id<HunXiaViewProtocol>)hunXiaViewDelegate hunXiaModel:(HunXiaDataModel *)hunxiaModel indexPatch:(NSIndexPath *)indexPath;

-(void)changeBackviewAlpha;

@end

NS_ASSUME_NONNULL_END
