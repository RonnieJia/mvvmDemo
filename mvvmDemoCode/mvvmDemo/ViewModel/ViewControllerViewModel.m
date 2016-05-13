//
//  ViewControllerViewModel.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "ViewControllerViewModel.h"
#import "DetailViewController.h"
#import "HTTPClient.h"
#import "Model.h"

@implementation ViewControllerViewModel
- (void)fetchHomeData {
    [HTTPClient NetRequestGETWithRequestURL:HomeApi WithParameter:nil WithReturnValeuBlock:^(id returnData) {
        [self makeData2Model:returnData];
    } WithErrorCodeBlock:^(id errorCode) {
        self.errorBlcok(errorCode);
    } WithFailureBlock:^{
        self.failedBlcok();
    }];
}

- (void)makeData2Model:(NSDictionary *)dataDic {
    NSMutableArray *modelArray = [NSMutableArray array];
    
    NSArray *dataArray = ObjForKeyInUnserializedJSONDic(dataDic, @"ReturnMessage");
    for (NSDictionary *dic in dataArray) {
        Model *model = [[Model alloc] init];
        for (NSString *key in dic.allKeys) {
            [model setValue:StringForKeyInUnserializedJSONDic(dic, key) forKey:key];
        }
        [modelArray addObject:model];
    }
    
    self.returnDataBlcok(modelArray);
}
+ (void)homeTableViewDidSelectWith:(id)model superController:(UINavigationController *)nav {
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.model = model;
    [nav pushViewController:detail animated:YES];
}
@end
