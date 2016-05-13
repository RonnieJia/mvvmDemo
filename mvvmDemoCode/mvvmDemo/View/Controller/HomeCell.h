//
//  HomeCell.h
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;
@interface HomeCell : UITableViewCell
@property (nonatomic, strong)Model *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
