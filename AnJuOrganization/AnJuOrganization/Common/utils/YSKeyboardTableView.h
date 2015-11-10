//
//  YSKeyboardTableView.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSKeyboardTableView : UITableView
{
    UIEdgeInsets    _priorInset;
    BOOL            _priorInsetSaved;
    BOOL            _keyboardVisible;
    CGRect          _keyboardRect;
    CGSize          _originalContentSize;
}

@property (nonatomic) CGFloat extraKeyboardHeight;

- (void)adjustOffsetIfNeeded;
@end
