//
//  HomeBaseReusableView.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/11.
//

#import "HomeBaseReusableView.h"
#import "Masonry.h"

@interface HomeBaseReusableView()

@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation HomeBaseReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createReusableView];
    }
    return self;
}

-(void)createReusableView {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(16);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        make.centerY.equalTo(self);
    }];
}

#pragma mark -- public

- (void)configHeadWithTitle:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma mark -- lazy

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _titleLabel;
}

@end
