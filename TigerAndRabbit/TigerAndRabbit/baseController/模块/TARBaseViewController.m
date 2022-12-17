//
//  TARBaseViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/3/13.
//

#import "TARBaseViewController.h"

@interface TARBaseViewController ()
{
    NSDictionary *_params;
}

@property(nonatomic,copy) NSDictionary *params;

@end

@implementation TARBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


#pragma mark -- BaseViewControllerProtocol

- (void)setParams:(NSDictionary *)params {
    _params = params;
}

#pragma mark -- lazy


- (NSDictionary *)params {
    return _params;
}
@end
