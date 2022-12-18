//
//  HomeBaseViewCollectionCell.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import "HomeBaseViewCollectionCell.h"
#import "Masonry.h"
#import "UIFont+TARFontTool.h"
#import "ColorerDefine.h"

@interface HomeBaseViewCollectionCell()

//游戏图标
@property(nonatomic,strong)UIImageView *gameIconImageView;
//游戏名称
@property(nonatomic,strong)UILabel *titleLabel;
//要布局的游戏model
@property(nonatomic,weak)id<GameModelProtocol> gameModel;
//描述label
@property(nonatomic,strong)UILabel *describeLabel;

@end

@implementation HomeBaseViewCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBaseView];
    }
    return self;
}

- (void)configGameModel:(id<GameModelProtocol>)gameModel {
    self.gameModel = gameModel;
    [self configData];
}

-(void)createBaseView {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 16;
    [self.contentView addSubview:self.gameIconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.describeLabel];
    [self configLayout];
}

-(void)configLayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(12);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
    }];
    [self.gameIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.gameIconImageView.mas_top);
        make.left.mas_equalTo(self.gameIconImageView.mas_right).offset(6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
    }];
}

-(void)configData {
    self.contentView.backgroundColor = [self.gameModel backColor];
    self.titleLabel.text = [self.gameModel gameNameTitle];
    self.gameIconImageView.image = [UIImage imageNamed:[self.gameModel gameIconName]];
    self.describeLabel.text = [self.gameModel gameDescribeText];
}

#pragma mark -- lazy

- (UIImageView *)gameIconImageView {
    if(!_gameIconImageView) {
        _gameIconImageView = [[UIImageView alloc] init];
        _gameIconImageView.layer.masksToBounds = YES;
        _gameIconImageView.layer.cornerRadius = 4;
    }
    return _gameIconImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont pingFangSCSemibold:15.0f];
    }
    return _titleLabel;
}

- (UILabel *)describeLabel {
    if(!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = DESCRIBETEXTCOLOR;
        _describeLabel.font = [UIFont pingFangSCRegular:12.0f];
        _describeLabel.numberOfLines = 3;
    }
    return _describeLabel;
}

@end
