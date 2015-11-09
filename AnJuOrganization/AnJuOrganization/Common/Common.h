//
//  Common.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//
// 判断是否为ios7
#define isIOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//获取屏幕的尺寸
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMainScreenWidth  [UIScreen mainScreen].bounds.size.width
//16进制色值转换
#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
//判断手机号是否有效
#define IS_AVAILABLE_mobliePhone(emailString) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", kVerMobliePhoneRegex] evaluateWithObject:emailString]
// 手机号验证 座机验证
#define kVerMobliePhoneRegex @"^(13[0-9]|15[0-9]|17[0-9]|18[0-9]|14[0-9])[0-9]{8}$"
//#define kVerMobliePhoneRegex @"^(\\+?86)?(1[34578]\\d{9})$"
#import <Foundation/Foundation.h>
#import "CustomNavigationBarController.h"
@interface Common : NSObject
+(UILabel *)nagationItemTitleView:(NSString *)title;
@end
