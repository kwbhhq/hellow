//
//  DisplayViewCollectionViewCell.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2023/1/1.
//

#import "DisplayViewCollectionViewCell.h"
#import "Masonry.h"
#import "ColorerDefine.h"
#import "UIFont+TARFontTool.h"
#import "DisplayViewTableViewCell.h"
#import "Nsarray+SafetyArray.h"
#import "Nsstring+TextStyleTool.h"

const int intervalDistance = 4;

#define DISPLAYVIEW_TABLEVIEWCELL   @"DisplayViewTableViewCell"

@interface DisplayViewCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIImageView *backImageView;
@property(nonatomic,strong)UILabel *hunxiaNamelabel;
@property(nonatomic,strong)UITableView *describeTableView;

@property(nonatomic,strong)HunXiaDataModel *hunXiaModel;
@property(nonatomic,weak)id<HunXiaViewProtocol> hunXiaDelegate;
@property(nonatomic,strong)NSIndexPath *cellIndexPath;

@end

@implementation DisplayViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBaseCellView];
    }
    return self;
}

-(void)createBaseCellView {
    self.contentView.backgroundColor = GAMECELLCOLOR;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8;
    [self.contentView addSubview:self.backImageView];
    [self.contentView addSubview:self.hunxiaNamelabel];
    [self.contentView addSubview:self.describeTableView];
    [self configLayout];
}

-(void)configLayout {
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(self.contentView);
    }];
    [self.hunxiaNamelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(intervalDistance);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-intervalDistance);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
    }];
    [self.describeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(32);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-intervalDistance);
        make.left.mas_equalTo(self.hunxiaNamelabel.mas_left);
        make.right.mas_equalTo(self.hunxiaNamelabel.mas_right);
    }];
}

#pragma mark -- DisplayViewCellProtocol

- (void)configDisplayViewCell:(id<HunXiaViewProtocol>)hunXiaViewDelegate hunXiaModel:(HunXiaDataModel *)hunxiaModel indexPatch:(NSIndexPath *)indexPath {
    self.cellIndexPath = indexPath;
    self.hunXiaDelegate = hunXiaViewDelegate;
    self.hunXiaModel = hunxiaModel;
    _hunxiaNamelabel.text = hunxiaModel.hunXiaName;
    [self.describeTableView reloadData];
}

-(void)changeBackviewAlpha {
    if(self.self.backImageView.alpha == 1) {
        self.backImageView.alpha = 0.2;
    } else {
        self.backImageView.alpha = 1;
    }
}

#pragma mark -- uitableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_hunXiaModel getDisPlayFieldNum];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *showKey = [DisplayDescribeArray safetyObjectAtIndex:indexPath.item];
    NSString *showText = [_hunXiaModel getShowContent:showKey];
    CGFloat itemWidth = CGFLOAT_MAX;
    if(self.hunXiaDelegate) {
        itemWidth = [self.hunXiaDelegate getItemWidth] - 4 * intervalDistance;
    }
    CGSize textSize = [showText sizeWithFont:[self getDescribeFrontWithKey:showKey] maxSize:CGSizeMake(itemWidth, CGFLOAT_MAX)];
    return textSize.height + 2 * intervalDistance;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DisplayViewTableViewCell *displayCell = [tableView dequeueReusableCellWithIdentifier:DISPLAYVIEW_TABLEVIEWCELL];
    NSString *showKey = [self getNeedShowKeyWithIndex:indexPath.item];
    displayCell.describeLabel.font = [self getDescribeFrontWithKey:showKey];
    displayCell.describeLabel.text = [_hunXiaModel getShowContent:showKey];
    displayCell.userInteractionEnabled = NO;
    displayCell.lineView.hidden = [_hunXiaModel getDisPlayFieldNum] == indexPath.item + 1;
    return displayCell;
}

#pragma mark -- private

- (UIFont *)getDescribeFrontWithKey:(NSString *)key {
    if([_hunXiaModel isAwakeSkillKey:key]) {
        return [UIFont pingFangSCMedium:13];
    }
    return [UIFont pingFangSCMedium:11];
}

-(NSString *)getNeedShowKeyWithIndex:(NSInteger)needShowIndex {
    NSArray *canShowArray = [_hunXiaModel getDisplayKeyArray];
    NSMutableArray *needShowArray = [[NSMutableArray alloc] init];
    for(int index = 0 ; index < DisplayDescribeArray.count ; index++) {
        NSString *tmpShowKey = [DisplayDescribeArray safetyObjectAtIndex:index];
        if(![canShowArray containsObject:tmpShowKey]) {
            continue;
        }
        [needShowArray safetyAddObject:tmpShowKey];
    }
    return [needShowArray safetyObjectAtIndex:needShowIndex];
}

#pragma mark -- lazy

- (UIImageView *)backImageView {
    if(!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.image = [UIImage imageNamed:@"HunXiaImage"];
        _backImageView.alpha = 0.2;
        _backImageView.layer.masksToBounds = YES;
        _backImageView.layer.cornerRadius = 8;
    }
    return _backImageView;
}

- (UILabel *)hunxiaNamelabel {
    if(!_hunxiaNamelabel) {
        _hunxiaNamelabel = [[UILabel alloc] init];
        _hunxiaNamelabel.font = [UIFont pingFangSCMedium:15];
        _hunxiaNamelabel.textAlignment = NSTextAlignmentCenter;
        _hunxiaNamelabel.textColor = [UIColor blackColor];
    }
    return _hunxiaNamelabel;
}

- (UITableView *)describeTableView {
    if(!_describeTableView) {
        _describeTableView = [[UITableView alloc] init];
        _describeTableView.backgroundColor = [UIColor clearColor];
        _describeTableView.delegate = self;
        _describeTableView.dataSource = self;
        [_describeTableView registerClass:[DisplayViewTableViewCell class] forCellReuseIdentifier:DISPLAYVIEW_TABLEVIEWCELL];
    }
    return _describeTableView;
}

@end
