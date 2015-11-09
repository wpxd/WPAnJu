//
//  WPExpandHeader.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPExpandHeader : NSObject<UIScrollViewDelegate>
#pragma mark - 类方法
/**
 *  生成一个CExpandHeader实例
 *
 *  @param scrollView
 *  @param expandView 可以伸展的背景View
 *
 *  @return CExpandHeader 对象
 */
+ (id)expandWithScrollView:(UIScrollView*)scrollView expandView:(UIView*)expandView;


#pragma mark - 成员方法
/**
 *
 *
 *  @param scrollView
 *  @param expandView
 */
- (void)expandWithScrollView:(UIScrollView*)scrollView expandView:(UIView*)expandView;

/**
 *  监听scrollViewDidScroll方法
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView*)scrollView;
@end
