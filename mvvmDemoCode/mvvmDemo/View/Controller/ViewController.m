//
//  ViewController.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerViewModel.h"
#import "Model.h"
#import "HomeCell.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"理财产品";
    
    ViewControllerViewModel *viewModel = [[ViewControllerViewModel alloc] init];
    [viewModel setBlockWithReturnDataBlock:^(id returnData) {
        self.dataArray = returnData;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
        
    } error:^(id errorCode) {
        [SVProgressHUD showWithStatus:errorCode maskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    } failed:^{
        [SVProgressHUD showWithStatus:@"请求错误" maskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
    [viewModel fetchHomeData];
    [SVProgressHUD showWithStatus:@"正在获取用户信息……"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView cellHeightForIndexPath:indexPath model:self.dataArray[indexPath.row] keyPath:@"model" cellClass:[HomeCell class] contentViewWidth:self.view.width];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [HomeCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [ViewControllerViewModel homeTableViewDidSelectWith:self.dataArray[indexPath.row] superController:self.navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
