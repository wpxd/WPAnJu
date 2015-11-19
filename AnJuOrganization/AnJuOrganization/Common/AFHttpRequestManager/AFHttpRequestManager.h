//
//  AFHttpRequestManager.h
//  RobClients
//
//  Created by apple on 15/5/12.
//  Copyright (c) 2015年 PengApple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
#import "WPHTTPSessionManager.h"

typedef void(^WPNetWorkCenterSuccessBlock)(NSDictionary *requestDic);
typedef void(^WPNetWorkCenterFailedBlock) (NSString *errorStr);
@interface AFHttpRequestManager : NSObject
@property (nonatomic, copy)WPNetWorkCenterSuccessBlock succBlock;
@property (nonatomic, copy)WPNetWorkCenterFailedBlock  failBlock;

//普通的post请求
- (void)httpPostManager:(NSString *)urlStr withRequestDic:(NSMutableDictionary *)dic success:(WPNetWorkCenterSuccessBlock)succ failed:(WPNetWorkCenterFailedBlock)fail;
//上传图片post
- (void)HttpPostImgManager:(NSString *)urlStr withRequestDic:(NSDictionary *)dic withbyPramsWithConstructingBody:(void (^)(id <AFMultipartFormData> formData))constructingBlock success:(WPNetWorkCenterSuccessBlock)succ failed:(WPNetWorkCenterFailedBlock)fail;
@end
