//
//  viewBControllerViewController.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/3/13.
//

#import "viewBControllerViewController.h"

@interface viewBControllerViewController ()

@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) UILabel *alabel;

@end

@implementation viewBControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.alabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 300, 50, 50)];
    self.alabel.text = @"cai";
    UITapGestureRecognizer *labelGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch)];
    self.alabel.userInteractionEnabled = YES;
    [self.alabel addGestureRecognizer:labelGes];
    [self.view addSubview:self.alabel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touche2) name:@"touch" object:nil];
    _key = @"kk";
}

- (void)touch {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"touch" object:nil];
    self.key = @"ddsg";
}

- (void)touche2 {
    self.key = @"ddsg";
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    NSLog(@"dds");
//
//}
@end
