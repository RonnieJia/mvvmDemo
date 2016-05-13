//
//  BaseViewModel.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (void)setBlockWithReturnDataBlock:(ReturnDataBlock)returnDataBlcok error:(ErrorBlock)errorBlock failed:(FailedBlock)failedBlock {
    _returnDataBlcok = returnDataBlcok;
    _errorBlcok = errorBlock;
    _failedBlcok = failedBlock;
}
@end
