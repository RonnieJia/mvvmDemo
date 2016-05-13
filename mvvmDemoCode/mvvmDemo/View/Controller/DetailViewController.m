//
//  DetailViewController.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "DetailViewController.h"
#import "Model.h"

@implementation DetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [self.view addSubview:scroll];
    
    UILabel *titleLabel = [UILabel new];
    [scroll addSubview:titleLabel];
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    
    UILabel *contentLabel = [UILabel new];
    [scroll addSubview:contentLabel];
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.font = [UIFont systemFontOfSize:18];
    
    scroll.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    titleLabel.sd_layout
    .leftSpaceToView(scroll, 20)
    .topSpaceToView(scroll, 25)
    .heightIs(30);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    contentLabel.sd_layout
    .leftSpaceToView(scroll, 20)
    .topSpaceToView(titleLabel, 20)
    .rightSpaceToView(scroll, 20)
    .autoHeightRatio(0);
    
    [scroll setupAutoContentSizeWithBottomView:contentLabel bottomMargin:30];
    
    titleLabel.text = self.model.GeneralName;
    contentLabel.text = self.model.DetailsInfo;
    
}
@end
