//
//  HomeBaseReusableView.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import <UIKit/UIKit.h>
#import "HomeBaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeBaseReusableView : UICollectionReusableView

- (void)configHeadWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
