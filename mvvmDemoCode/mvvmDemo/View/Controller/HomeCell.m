
//
//  HomeCell.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "HomeCell.h"
#import "Model.h"

@interface HomeCell ()
@property(nonatomic, weak)UIImageView *imgView;
@end

@implementation HomeCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"homeCell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}
- (void)setup {
    UIImageView *imgView = [UIImageView new];
    [self.contentView addSubview:imgView];
    
    imgView.sd_layout
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .topSpaceToView(self.contentView, 0)
    .autoHeightRatio(0.5);
    self.imgView = imgView;
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self setupAutoHeightWithBottomView:imgView bottomMargin:10];
}

- (void)setModel:(Model *)model {
    _model = model;
    NSString *string = [NSString stringWithFormat:@"https://api.yupen.cn/%@",model.imgurl];
    [self.imgView setImageWithURL:[NSURL URLWithString:string]];
}
@end
