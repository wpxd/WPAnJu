//
//  WPHTTPSessionManager.m
//  AFTestDemo
//
//  Created by apple on 14/12/30.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import "WPHTTPSessionManager.h"

@implementation WPHTTPSessionManager
+ (instancetype)sharedClient {
    static  WPHTTPSessionManager *WPManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.timeoutIntervalForRequest = 30;
        WPManager = [[WPHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        WPManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return WPManager;
}
@end
