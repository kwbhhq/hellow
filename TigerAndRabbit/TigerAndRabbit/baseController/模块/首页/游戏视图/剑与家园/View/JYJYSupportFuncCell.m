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

@end

@implementation JYJYSupportFuncCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createBaseView];
    }
    return self;
}

- (void)configFunctionModel:(id<JYJYDataModelProtocol>)funcModel {
    self.funcModel = funcModel;
    [self configData];
}

-(void)createBaseView {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.describeLabel];
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
}

- (void)configData {
    self.titleLabel.text = [self.funcModel functionName];
    self.describeLabel.text = [self.funcModel describeContent];
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

@end
