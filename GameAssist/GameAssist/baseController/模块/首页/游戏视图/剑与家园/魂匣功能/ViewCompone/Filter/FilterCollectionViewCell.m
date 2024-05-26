//
//  FilterDisplayCollectionViewCell.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/14.
//

#import "FilterCollectionViewCell.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "Nsstring+TextStyleTool.h"
#import "UIFont+TARFontTool.h"

@interface FilterCollectionViewCell()

@property(nonatomic,strong)UILabel *filterLabel;
@property(nonatomic,strong)UIImageView *filterImageView;
@property(nonatomic,strong)UIView *labelBackView;

@property(nonatomic,strong)NSIndexPath *indexPath;

@property(nonatomic,weak)id<FilterViewCellDataSource> dataSource;

@end

@implementation FilterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBaseCellView];
    }
    return self;
}

-(void)createBaseCellView {
    self.contentView.backgroundColor = SEARCHBACKCOLOR;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 8;
    [self.contentView addSubview:self.labelBackView];
    [self.labelBackView addSubview:self.filterLabel];
    [self.labelBackView addSubview:self.filterImageView];
    [self configLayout];
}

-(void)configLayout {
    [self.labelBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerY.centerX.equalTo(self.contentView);
    }];
    [self.filterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.labelBackView);
        make.right.equalTo(self.labelBackView.mas_right);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    [self.filterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.labelBackView);
        make.left.equalTo(self.labelBackView.mas_left);
    }];
}

#pragma mark -- public

- (void)refreshImageIsExpand:(BOOL)isExpand {
    NSString *imageName = isExpand ? @"arrow_drop_up" : @"arrow_drop_down";
    UIImage *tmpImage = [UIImage imageNamed:imageName];
    [self.filterImageView setImage:tmpImage];
}

- (void)refreshCellColor {
    if([self.dataSource isSelected:self.indexPath.item cellTag:self.tag]) {
        self.labelBackView.backgroundColor = FILTERBACKCOLOR;
        self.contentView.backgroundColor = FILTERBACKCOLOR;
        self.filterLabel.backgroundColor = FILTERBACKCOLOR;
    }else {
        self.labelBackView.backgroundColor = SEARCHBACKCOLOR;
        self.contentView.backgroundColor = SEARCHBACKCOLOR;
        self.filterLabel.backgroundColor = SEARCHBACKCOLOR;
    }
}

- (void)configCellDataSource:(id<FilterViewCellDataSource>)dataSource indexPatch:(NSIndexPath *)indexPatch tag:(NSInteger)tag {
    self.tag = tag;
    self.indexPath = indexPatch;
    self.dataSource = dataSource;
    [self refreshView];
}

- (void)refreshView {
    self.filterLabel.text = [self.dataSource labelName:self.indexPath.item cellTag:self.tag];
    
    [self layoutViews];
    [self refreshCellColor];
}

#pragma mark -- private

-(void)layoutViews {
    CGSize textSize = [[self.dataSource labelName:self.indexPath.item cellTag:self.tag] sizeWithFont:[UIFont pingFangSCRegular:12] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.filterImageView.hidden = ![self.dataSource isShowSwitchImage:self.indexPath.item cellTag:self.tag];
    if(!self.filterImageView.hidden) {
        [self.filterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.labelBackView);
            make.left.equalTo(self.labelBackView.mas_left);
        }];
        [self.labelBackView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
            make.centerX.equalTo(self.contentView).offset(4);
            make.width.mas_equalTo(textSize.width+24);
        }];
    } else {
        [self.filterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(self.labelBackView);
        }];
        [self.labelBackView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.centerY.centerX.equalTo(self.contentView);
            make.width.mas_equalTo(textSize.width);
        }];
    }
}

#pragma mark -- lazy

- (UILabel *)filterLabel {
    if(!_filterLabel) {
        _filterLabel = [[UILabel alloc] init];
        _filterLabel.backgroundColor = SEARCHBACKCOLOR;
        _filterLabel.font = [UIFont pingFangSCRegular:12];
        _filterLabel.adjustsFontSizeToFitWidth = YES;
        _filterLabel.minimumScaleFactor = 10;
        _filterLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _filterLabel;
}

- (UIImageView *)filterImageView {
    if(!_filterImageView) {
        _filterImageView = [[UIImageView alloc] init];
        [_filterImageView setImage:[UIImage imageNamed:@"arrow_drop_down"]];
    }
    return _filterImageView;
}

-(UIView *)labelBackView {
    if(!_labelBackView) {
        _labelBackView = [[UIView alloc] init];
    }
    return _labelBackView;
}

@end
