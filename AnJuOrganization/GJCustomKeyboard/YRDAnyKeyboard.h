//
//  YRDAnyKeyboard.h
//  ZenKeyboard
//
//  Created by 王亮 on 15/7/6.
//  Copyright (c) 2015年 com.zen. All rights reserved.
//
#import "UIButton+Helper.h"
#import "UIView+Helper.h"
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YRDAnyKeyboardStyle) {
    /**
     *  无功能键
     */
    YRDAnyKeyboardStyleNone,
    /**
     *  空(@"")白功能键
     */
    YRDAnyKeyboardStyleBlank,
    /**
     *  点(.)功能键
     */
    YRDAnyKeyboardStyleDot,
    /**
     *  叉(X)功能键
     */
    YRDAnyKeyboardStyleFork,
    /**
     *  横杠(-)功能键
     */
    YRDAnyKeyboardStyleMinus,
    
//  如下枚举值是为了兼容 默认的类型，在YRDAnyKeyboard中不用
    
    YRDUIKeyboardTypeDefault,                // Default type for the current input method.
    YRDUIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters, non-ASCII keyboards remain active
    YRDUIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
    YRDUIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
    YRDUIKeyboardTypeNumberPad,              // A number pad (0-9). Suitable for PIN entry.
    YRDUIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
    YRDUIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
    YRDUIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
    YRDUIKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
    YRDUIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
    YRDUIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
    
    YRDUIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated

};
@protocol YRDAnyKeyboardDelegate <NSObject>
@optional
- (void)numericKeyDidPressed:(int)key;

- (void)callapseKeyDidPressed;
- (void)functionalKeyDidPressed;
- (void)doneKeyDidPressed;
- (void)backspaceKeyDidPressed;

@end
@interface YRDAnyKeyboard : UIView
 
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrBtnKeys;
@property (nonatomic, weak) UITextField *txtf;
@property (nonatomic,unsafe_unretained) YRDAnyKeyboardStyle anyKeyBoardStyle;

@property (nonatomic,weak) id<YRDAnyKeyboardDelegate,UITextFieldDelegate> delegate;


@end
