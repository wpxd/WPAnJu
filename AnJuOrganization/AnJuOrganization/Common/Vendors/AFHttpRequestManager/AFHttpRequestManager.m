//
//  AFHttpRequestManager.m
//  RobClients
//
//  Created by apple on 15/5/12.
//  Copyright (c) 2015年 PengApple. All rights reserved.
//

#import "AFHttpRequestManager.h"

@implementation AFHttpRequestManager
//普通的post请求
- (void)httpPostManager:(NSString *)urlStr withRequestDic:(NSMutableDictionary *)dic success:(WPNetWorkCenterSuccessBlock)succ failed:(WPNetWorkCenterFailedBlock)fail
{
    WEAKSELF
    self.succBlock = succ;
    self.failBlock = fail;
    if([Common reachability]!=nil&&[[Common reachability] currentReachabilityStatus]==NotReachable){
        [Common showNoNetWorkView];
//        self.failBlock(@"亲,网络不给力呦,请先检查你的网络");
        return ;
    }
    //有时元数据af不能把它转换成json格式，一直报1016的错误，解决方法是在af库中找到AFJSONResponseSerializer这个类，在此类的self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];集合中加上text/html这个类型！！！
    [[WPHTTPSessionManager sharedClient] POST:urlStr parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.succBlock)
        {
            weakSelf.succBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.failBlock) {
            weakSelf.failBlock(@"亲,网络不给力呦");
        }
    }];
}
//上传图片post
- (void)HttpPostImgManager:(NSString *)urlStr withRequestDic:(NSDictionary *)dic withbyPramsWithConstructingBody:(void (^)(id <AFMultipartFormData> formData))constructingBlock success:(WPNetWorkCenterSuccessBlock)succ failed:(WPNetWorkCenterFailedBlock)fail
{
    
}
@end
