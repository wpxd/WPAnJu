//
//  Common.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "Common.h"

static UIView *noNetWorkView=nil;
static Reachability* curReach;
@implementation Common
+(UILabel *)nagationItemTitleView:(NSString *)title{
    UILabel *lableText=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
    lableText.textAlignment=NSTextAlignmentCenter;
    lableText.text=title;
    lableText.textColor=UIColorFromHex(0x333333);
    lableText.backgroundColor=[UIColor clearColor];
    lableText.font=[UIFont boldSystemFontOfSize:17];
    return lableText;
}
//退出登录
+(void)loginQuit
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kAppToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//用户是否登录
+(BOOL)userIsLogin
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:kAppToken]==nil){
        return NO;
    }
    return YES;
}
+(void)showAlertView:(NSString *)message{
    UIAlertView  *alert= [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:message
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"确认",nil];
    [alert show];
}
//判断是否是null
+ (BOOL)checkoutIsNSNull:(id)object
{
    if ([object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+(void)showNoNetWorkView{
    if(noNetWorkView==nil){
        noNetWorkView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        noNetWorkView.backgroundColor=[UIColor blackColor];
        noNetWorkView.layer.cornerRadius=10;
        UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(0, 0,80, 80)];
        lable.backgroundColor=[UIColor clearColor];
        lable.text=@"网络不给力";
        lable.textAlignment=NSTextAlignmentCenter;
        lable.font=[UIFont systemFontOfSize:14];
        lable.textColor=[UIColor whiteColor];
        [noNetWorkView addSubview:lable];
        lable.center=noNetWorkView.center;
    }
    noNetWorkView.center=[[UIApplication sharedApplication] delegate].window.center;
    [[[UIApplication sharedApplication] delegate].window addSubview:noNetWorkView];
    [self performSelector:@selector(unShowNoNetWork) withObject:nil afterDelay:1.5];
    
}
+(void)unShowNoNetWork{
    [noNetWorkView removeFromSuperview];
}
+ (void)setReachability:(Reachability *)reachability{
    curReach=reachability;
}
+ (Reachability *)reachability{
    return  curReach;
}
@end
