//
//  HomeNavigationController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/11/27.
//

#import "HomeNavigationController.h"
#import "HomeBaseViewController.h"

@interface HomeNavigationController ()

@end

@implementation HomeNavigationController

+ (instancetype)shareInstance {
    static HomeNavigationController* _instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        HomeBaseViewController *homeBaseController = [[HomeBaseViewController alloc] init];
        _instance = [[self alloc] initWithRootViewController:homeBaseController] ;
    }) ;
    return _instance ;
}

@end
