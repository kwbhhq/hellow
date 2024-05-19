//
//  Nsstring+TextStyleTool.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString(TextStyleTool)

-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
