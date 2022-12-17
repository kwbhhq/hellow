//
//  HomeBaseViewCollectionCell.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import <UIKit/UIKit.h>
#import "HomeBaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeBaseViewCollectionCell : UICollectionViewCell

- (void)configGameModel:(id<GameModelProtocol>)gameModel;

@end

NS_ASSUME_NONNULL_END
