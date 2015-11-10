//
//  UIScrollView+AdaptiveKeyboardHeight.h
//  XDWenger
//
//  Created by 张旭东 on 15/9/17.
//  Copyright © 2015年 张旭东. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 *  scollview的子view  键盘响应事件的一个处理
 */
@interface UIScrollView (AdaptiveKeyboardHeight)
/**
 *  默认是NO 若果为YES他会替你处理键盘事件 
 */
@property (nonatomic ,assign)BOOL autoAdaptiveKeyBoard;

/**
 *  子试图取消第一相应
 */
- (void)subViewresigenFirstResponder;

@end

