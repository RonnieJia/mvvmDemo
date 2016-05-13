//
//  BaseViewModel.h
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"


@interface BaseViewModel : NSObject

@property(nonatomic, copy)ReturnDataBlock returnDataBlcok;
@property(nonatomic, copy)ErrorBlock errorBlcok;
@property(nonatomic, copy)FailedBlock failedBlcok;


- (void)setBlockWithReturnDataBlock:(ReturnDataBlock)returnDataBlcok error:(ErrorBlock)errorBlock failed:(FailedBlock)failedBlock;

@end
