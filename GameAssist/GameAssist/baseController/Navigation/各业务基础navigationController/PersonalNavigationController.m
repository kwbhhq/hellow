//
//  PersonalNavigationController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "PersonalNavigationController.h"
#import "PersonalBaseViewController.h"

@interface PersonalNavigationController ()

@end

@implementation PersonalNavigationController

+ (instancetype)shareInstance {
    static PersonalNavigationController* _instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        PersonalBaseViewController *personalBaseController = [[PersonalBaseViewController alloc] init];
        _instance = [[self alloc] initWithRootViewController:personalBaseController] ;
    }) ;
    return _instance ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"我的";
}

@end
