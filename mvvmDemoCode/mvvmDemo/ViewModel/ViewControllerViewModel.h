//
//  ViewControllerViewModel.h
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "BaseViewModel.h"

@class Model;

@interface ViewControllerViewModel : BaseViewModel

- (void)fetchHomeData;

+ (void)homeTableViewDidSelectWith:(Model *)model superController:(UINavigationController *)nav;
@end
