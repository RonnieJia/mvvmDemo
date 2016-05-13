//
//  Header.h
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef Header_h
#define Header_h

typedef void(^ReturnDataBlock)(id returnData);
typedef void(^ErrorBlock)(id errorCode);
typedef void(^FailedBlock)();
typedef void(^NetStateBlock)(BOOL netState);


#endif /* Header_h */
