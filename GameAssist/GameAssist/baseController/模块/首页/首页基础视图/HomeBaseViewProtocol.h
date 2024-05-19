//
//  HomeBaseViewProtocol.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/9.
//

#import <UIKit/UIKit.h>

#ifndef HomeBaseViewProtocol_h
#define HomeBaseViewProtocol_h

@protocol HomeBaseViewDataSource <NSObject>

@end

@protocol GameModelProtocol <NSObject>

@required
-(NSString *)gameNameTitle;
-(NSString *)gameIconName;
-(UIColor *)backColor;
-(NSString *)gameDescribeText;

@end

#endif /* HomeBaseViewProtocol_h */
