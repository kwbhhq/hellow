//
//  DisplayViewTableViewCell.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/8.
//

#import "DisplayViewTableViewCell.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "UIFont+TARFontTool.h"
#import "DisplayViewCollectionViewCell.h"

@implementation DisplayViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createBaseView];
    }
    return self;
}

-(void)createBaseView {
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.describeLabel];
    [self.contentView addSubview:self.lineView];
    [self configLayout];
}

- (void)configLayout {
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(intervalDistance);
        make.right.equalTo(self.contentView.mas_right).offset(-intervalDistance);
        make.top.equalTo(self.contentView.mas_top).offset(2);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-2);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)describeLabel {
    if(!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.font = [UIFont pingFangSCMedium:12];
        _describeLabel.textAlignment = NSTextAlignmentLeft;
        _describeLabel.numberOfLines = 0;
        _describeLabel.textColor = DEEPGRAYCOLOR;
    }
    return _describeLabel;
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = DIVIDE_DEEPCOLOR;
    }
    return _lineView;
}
@end
