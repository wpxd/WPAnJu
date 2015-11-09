/*!
 @header     GJColor.m
 @abstract   UIColor的Category
 @discussion UIColor的Category
 @author     xiaoliangguo1@creditease.cn
 */

#import <UIKit/UIKit.h>

@interface UIColor (GJCategory)

+ (UIColor *)colorWithR:(float)r G:(float)g B:(float)b;
+ (UIColor *)colorWithR:(float)r G:(float)g B:(float)b A:(float)a;

/**
 *  十六进制形式传入
 *  @param hex eg：0xff3355
 *  @return color对象
 */
+ (UIColor *)colorWithHex:(int)hex;
+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)a;

@end
