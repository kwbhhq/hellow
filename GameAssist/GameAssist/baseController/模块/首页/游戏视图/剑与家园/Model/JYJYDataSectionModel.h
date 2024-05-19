//
//  JYJYDataSectionModel.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import <Foundation/Foundation.h>
#import "JYJYDataModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JYJYDataSectionModel : NSObject

@property(nonatomic,strong)NSArray<id<JYJYDataModelProtocol>> *supportFunctionArray;
@property(nonatomic,copy)NSString *sectionName;

@end

NS_ASSUME_NONNULL_END
