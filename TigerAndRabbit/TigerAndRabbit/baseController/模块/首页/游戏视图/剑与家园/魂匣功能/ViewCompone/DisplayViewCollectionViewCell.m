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
#import "HunXiaDataModel.h"
#import "DisplayViewTableViewCell.h"
#import "Nsarray+SafetyArray.h"
#import "Nsstring+TextStyleTool.h"
#import "DisplayView.h"

#define DISPLAYVIEW_TABLEVIEWCELL   @"DisplayViewTableViewCell"

@interface DisplayViewCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIImageView *backImageView;
@property(nonatomic,strong)UILabel *hunxiaNamelabel;
@property(nonatomic,strong)UITableView *describeTableView;

@property(nonatomic,strong)HunXiaDataModel *hunXiaModel;
@property(nonatomic,weak)id<DisplayViewCellDataSource> cellDataSource;
@property(nonatomic,weak)id<ShowViewProtocol> displayDelegate;
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
        make.left.mas_equalTo(self.contentView.mas_left).offset(INTERVALDISTANCE);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-INTERVALDISTANCE);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
    }];
    [self.describeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(32);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-INTERVALDISTANCE);
        make.left.mas_equalTo(self.hunxiaNamelabel.mas_left);
        make.right.mas_equalTo(self.hunxiaNamelabel.mas_right);
    }];
}

- (void)configDisplayViewDataSource:(id<DisplayViewCellDataSource>)dataSource displayViewDelegate:(id<ShowViewProtocol>)displayViewDelegate indexPatch:(NSIndexPath *)indexPath {
    self.cellDataSource = dataSource;
    self.cellIndexPath = indexPath;
    self.displayDelegate = displayViewDelegate;
    _hunXiaModel = [self.cellDataSource getHunXiaModelWithCellIndex:indexPath];
    [self loadView];
}

#pragma mark -- private

-(void)loadView {
    [self loadViewCornerRadius];
    [self loadImageView];
    [self loadHunXiaNameLable];
    [self.describeTableView reloadData];
}

-(void)loadViewCornerRadius {
    if(![self.cellDataSource respondsToSelector:@selector(viewCornerRadius)]) {
        return;
    }
    CGFloat cellCornerRadius = [self.cellDataSource viewCornerRadius];
    if(cellCornerRadius <= 0) {
        return;
    }
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cellCornerRadius;
    _backImageView.layer.masksToBounds = YES;
    _backImageView.layer.cornerRadius = cellCornerRadius;
}

-(void)loadHunXiaNameLable {
    _hunxiaNamelabel.text = _hunXiaModel.hunXiaName;
    if([self.cellDataSource respondsToSelector:@selector(hunXiaNameFront)]) {
        _hunxiaNamelabel.font = [self.cellDataSource hunXiaNameFront];
    }
    if([self.cellDataSource respondsToSelector:@selector(hunXiaNameAlignment)]) {
        _hunxiaNamelabel.textAlignment = [self.cellDataSource hunXiaNameAlignment];
    }
}

-(void)loadImageView {
    _backImageView.image = [self.cellDataSource viewBackImage];
    if([self.cellDataSource respondsToSelector:@selector(backImageViewAlpha)]) {
        _backImageView.alpha = [self.cellDataSource backImageViewAlpha];
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
    if(self.displayDelegate) {
        itemWidth = [self.displayDelegate getItemWidth] - 4 * INTERVALDISTANCE;
    }
    CGSize textSize = [showText sizeWithFont:[self getDescribeFrontWithKey:showText] maxSize:CGSizeMake(itemWidth, CGFLOAT_MAX)];
    return textSize.height + 2 * INTERVALDISTANCE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DisplayViewTableViewCell *displayCell = [tableView dequeueReusableCellWithIdentifier:DISPLAYVIEW_TABLEVIEWCELL];
    NSString *showKey = [self getNeedShowKeyWithIndex:indexPath.item];
    displayCell.describeLabel.font = [self getDescribeFrontWithKey:showKey];
    displayCell.describeLabel.text = [_hunXiaModel getShowContent:showKey];
    displayCell.userInteractionEnabled = NO;
    if([self.cellDataSource respondsToSelector:@selector(describeAlignment)]) {
        displayCell.describeLabel.textAlignment = [self.cellDataSource describeAlignment];
    }
    displayCell.lineView.hidden = [_hunXiaModel getDisPlayFieldNum] == indexPath.item + 1;
    return displayCell;
}

#pragma mark -- private

- (UIFont *)getDescribeFrontWithKey:(NSString *)key {
    if([_hunXiaModel isAwakeSkillKey:key]) {
        if([self.cellDataSource respondsToSelector:@selector(awakeDescribeFront)]) {
            return [self.cellDataSource awakeDescribeFront];
        }
    } else {
        if([self.cellDataSource respondsToSelector:@selector(describeFront)]) {
            return [self.cellDataSource describeFront];
        }
    }
    return [UIFont pingFangSCRegular:12];
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
    }
    return _backImageView;
}

- (UILabel *)hunxiaNamelabel {
    if(!_hunxiaNamelabel) {
        _hunxiaNamelabel = [[UILabel alloc] init];
        _hunxiaNamelabel.font = [UIFont pingFangSCSemibold:15];
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
