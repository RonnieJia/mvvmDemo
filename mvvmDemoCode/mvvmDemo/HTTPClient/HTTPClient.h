//
//  HTTPClient.h
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPClient : NSObject
+(BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnDataBlock) block
                   WithErrorCodeBlock: (ErrorBlock) errorBlock
                     WithFailureBlock: (FailedBlock) failureBlock;

#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnDataBlock) block
                  WithErrorCodeBlock: (ErrorBlock) errorBlock
                    WithFailureBlock: (FailedBlock) failureBlock;


@end
