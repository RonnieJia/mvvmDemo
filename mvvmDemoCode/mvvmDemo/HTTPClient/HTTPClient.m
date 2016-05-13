//
//  HTTPClient.m
//  mvvmDemo
//
//  Created by 辉贾 on 16/3/28.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "HTTPClient.h"
#import "AFNetworking.h"

@implementation HTTPClient

+ (BOOL)netWorkReachabilityWithURLString:(NSString *)strUrl {
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    return netState;
}

+ (void)NetRequestGETWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnDataBlock)block WithErrorCodeBlock:(ErrorBlock)errorBlock WithFailureBlock:(FailedBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    AFHTTPRequestOperation *op = [manager GET:requestURLString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        RJLog(@"%@", dic);
        
        if (IntForKeyInUnserializedJSONDic(dic, @"ReturnStatus") == 0) {
            block(dic);
        } else {
            errorBlock(StringForKeyInUnserializedJSONDic(dic, @"ReturnMessage"));
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error description]);
        failureBlock();
    }];
    
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op start];
}


+ (void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnDataBlock)block WithErrorCodeBlock:(ErrorBlock)errorBlock WithFailureBlock:(FailedBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    AFHTTPRequestOperation *op = [manager POST:requestURLString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        RJLog(@"%@", dic);
        
        block(dic);
        /***************************************
         在这做判断如果有dic里有errorCode
         调用errorBlock(dic)
         没有errorCode则调用block(dic
         ******************************/
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock();
    }];
    
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op start];
}
@end
