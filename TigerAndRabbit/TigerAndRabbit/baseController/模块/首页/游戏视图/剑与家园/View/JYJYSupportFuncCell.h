//
//  JYJYSupportFuncCell.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import <UIKit/UIKit.h>
#import "JYJYDataModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JYJYSupportFuncCell : UITableViewCell

- (void)configFunctionModel:(id<JYJYDataModelProtocol>)funcModel;

@end

NS_ASSUME_NONNULL_END
