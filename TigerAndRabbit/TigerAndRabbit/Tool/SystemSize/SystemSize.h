//
//  SystemSize.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/7/9.
//

#ifndef SystemSize_h
#define SystemSize_h

#pragma mark -  设备高度

//设备的宽高
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#pragma mark -  设备性号判断

#define DT_IS_IPHONEX_XS   (SCREEN_HEIGHT == 812.f)  //是否是iPhoneX、iPhoneXS
#define DT_IS_IPHONEXR_XSMax   (SCREEN_HEIGHT == 896.f)  //是否是iPhoneXR、iPhoneX Max
#define IS_IPHONEX_SET  (DT_IS_IPHONEX_XS||DT_IS_IPHONEXR_XSMax)  //是否是iPhoneX系列手机

#pragma mark -  状态栏导航栏等高度

//状态栏高度
#define STATE_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define NAVIGATION_HEIGHT STATE_HEIGHT + 44


#endif /* SystemSize_h */
