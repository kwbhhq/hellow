//
//  JYJYSupportFuncCell.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/18.
//

#import "JYJYSupportFuncCell.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "UIFont+TARFontTool.h"

@interface JYJYSupportFuncCell()

//游戏名称
@property(nonatomic,strong)UILabel *titleLabel;
//要布局的游戏model
@property(nonatomic,weak)id<JYJYDataModelProtocol> funcModel;
//描述label
@property(nonatomic,strong)UILabel *describeLabel;
//分割线
@property(nonatomic,strong)UIView *lineView;

@end

@implementation JYJYSupportFuncCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createBaseView];
    }
    return self;
}

-(void)createBaseView {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.describeLabel];
    [self.contentView addSubview:self.lineView];
    [self configLayout];
}

- (void)configLayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-32);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark -- public

- (void)configFunctionModel:(id<JYJYDataModelProtocol>)funcModel isLastCell:(BOOL)isLastCell {
    self.funcModel = funcModel;
    [self configDataWithIsLastCell:isLastCell];
}

#pragma mark -- private

- (void)configDataWithIsLastCell:(BOOL)isLastCell {
    self.titleLabel.text = [self.funcModel functionName];
    self.describeLabel.text = [self.funcModel describeContent];
    self.lineView.hidden = isLastCell;
}

#pragma mark -- lazy

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont pingFangSCRegular:16.0f];
    }
    return _titleLabel;
}

- (UILabel *)describeLabel {
    if(!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = DESCRIBETEXTCOLOR;
        _describeLabel.font = [UIFont pingFangSCRegular:13.0f];
    }
    return _describeLabel;
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = CONTROLLERVIEWBACKCOLOR;
    }
    return _lineView;
}

@end
