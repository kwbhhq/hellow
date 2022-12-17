//
//  TARBaseTabBarController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/4/4.
//

#import "TARBaseTabBarController.h"
#import "BaseNavigationControllerManager.h"
#import "Masonry.h"

@interface TARBaseTabBarController()<UITabBarControllerDelegate>

@end

@implementation TARBaseTabBarController

#pragma market -- public
- (instancetype)init {
    if(self=[super init]) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self setViewControllers:[BaseNavigationControllerManager createBaseNavigationControllerArray]];
}

@end
