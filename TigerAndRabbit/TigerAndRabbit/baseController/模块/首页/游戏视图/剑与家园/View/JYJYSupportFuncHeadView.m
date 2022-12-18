//
//  JYJYSupportFuncHeadView.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import "JYJYSupportFuncHeadView.h"
#import "Masonry.h"
#import "UIFont+TARFontTool.h"

@interface JYJYSupportFuncHeadView()

@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation JYJYSupportFuncHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createReusableView];
    }
    return self;
}

-(void)createReusableView {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(16);
        make.centerY.equalTo(self.contentView);
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
        _titleLabel.font = [UIFont pingFangSCSemibold:17.0f];
    }
    return _titleLabel;
}

@end
