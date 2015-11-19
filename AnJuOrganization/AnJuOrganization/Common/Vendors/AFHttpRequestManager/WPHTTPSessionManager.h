//
//  WPHTTPSessionManager.h
//  AFTestDemo
//
//  Created by apple on 14/12/30.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface WPHTTPSessionManager : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
