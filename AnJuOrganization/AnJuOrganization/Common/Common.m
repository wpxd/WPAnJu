//
//  Common.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "Common.h"

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
@end
