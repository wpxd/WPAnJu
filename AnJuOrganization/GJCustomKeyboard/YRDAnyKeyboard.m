//
//  YRDAnyKeyboard.m
//  ZenKeyboard
//
//  Created by 王亮 on 15/7/6.
//  Copyright (c) 2015年 com.zen. All rights reserved.
//

#import "YRDAnyKeyboard.h"

@interface YRDAnyKeyboard()
@property (nonatomic,assign) id<UITextInput> textInputDelegate;
@end
@implementation YRDAnyKeyboard

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(void)setAnyKeyBoardStyle:(YRDAnyKeyboardStyle)anyKeyBoardStyle
//-(void)layoutSubviews
{
    _anyKeyBoardStyle = anyKeyBoardStyle;
    UIButton * btnFunction = self.arrBtnKeys[11];
     btnFunction.enabled = YES;
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];
    NSUInteger loc = [self.txtf.text length];
    btnConfirmation.enabled = (loc > 0);
    
    switch (_anyKeyBoardStyle) {
        case YRDAnyKeyboardStyleNone: {
        
            break;
        }
        case YRDAnyKeyboardStyleBlank: {
            btnFunction.enabled = NO;
            [btnFunction setTitle:@"" forState:(UIControlStateNormal)];
            break;
        }
        case YRDAnyKeyboardStyleDot: {
            
            [btnFunction setTitle:@"." forState:(UIControlStateNormal)];
            break;
        }
        case YRDAnyKeyboardStyleFork: {
             [btnFunction setTitle:@"X" forState:(UIControlStateNormal)];
            
            break;
        }
        case YRDAnyKeyboardStyleMinus: {
               [btnFunction setTitle:@"-" forState:(UIControlStateNormal)];

            break;
        }
        default: {
            break;
        }
    }
}

- (IBAction)pressAction:(UIButton *)sender forEvent:(UIEvent *)event {

    NSUInteger loc = [self.txtf.text length];
    NSRange range =NSMakeRange(loc, 0);
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];

    switch (sender.tag) {
//            收起键盘
        case  11:{
            [self.txtf resignFirstResponder];
            if (_delegate && [self.delegate respondsToSelector:@selector(callapseKeyDidPressed)]) {
                [self.delegate callapseKeyDidPressed];
            }
            break;
            
        }
//            特别盘
        case  12:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange:range replacementString:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
                if (!result) return;
                
            }
            [self.textInputDelegate insertText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
            if (_delegate && [self.delegate respondsToSelector:@selector(functionalKeyDidPressed)]) {
                [self.delegate functionalKeyDidPressed];
            }
                btnConfirmation.enabled = YES;
            break;
            
        }
//            确定
        case  13:{
//            self.txtf.text =  @"4";
            if (_delegate && [self.delegate respondsToSelector:@selector( doneKeyDidPressed)]) {
                [self.delegate doneKeyDidPressed];
            
            }
             [self.txtf resignFirstResponder];
            break;
            
        }
//            删除
        case  14:{
            [self.textInputDelegate deleteBackward];
            if (_delegate && [self.delegate respondsToSelector:@selector( backspaceKeyDidPressed)]) {
                [self.delegate backspaceKeyDidPressed];
            }
            loc = [self.txtf.text length];
             btnConfirmation.enabled = loc;
            break;
            
        }
//         按键“0”
        case  10:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange: range replacementString:@"0"];
                if (!result) return;
                
            }
            
            int num = 0;
            [self.textInputDelegate insertText:[NSString stringWithFormat:@"%ld",(long)num]];
            if (_delegate && [self.delegate respondsToSelector:@selector( numericKeyDidPressed:)]) {
                [self.delegate numericKeyDidPressed:( int )num];
            }
            btnConfirmation.enabled = YES;
            break;
        }
        default:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange: range replacementString:FORMATER(@"%ld",(long)sender.tag)];
                if (!result) return;
                
            }
            [self.textInputDelegate insertText:FORMATER(@"%ld",(long)sender.tag)];
            if (_delegate && [self.delegate respondsToSelector:@selector( numericKeyDidPressed:)]) {
                [self.delegate numericKeyDidPressed:( int )sender.tag];
            }
            btnConfirmation.enabled = YES;
            break;
        }
           
    }
}

- (void)setTxtf:(UITextField *)textField {
    if (textField) {
        _txtf = textField;
        _txtf.inputView = self;
        self.textInputDelegate = _txtf;
        NSError * error;
        BWS(blockWeakSelf);
        [textField aspect_hookSelector:@selector(setText:) withOptions:AspectPositionAfter usingBlock: ^(id<AspectInfo> aspectInfo){
            [blockWeakSelf observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
        } error:&error];
        
        /* 关键步骤 */
//         [textField addObserver:self
//                              forKeyPath:@"text"
//                                  options:NSKeyValueObservingOptionNew
//                               context:(__bridge void *)(textField)];
    }else{
        _txtf = nil;
        _txtf.inputView = nil;
        self.textInputDelegate = nil;
//        [textField removeObserver:self forKeyPath:@"text" context:(__bridge void *)(textField)];
    }

    
}

/* KVO function， 只要object的keyPath属性发生变化，就会调用此函数*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSUInteger loc = [self.txtf.text length];
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];
    btnConfirmation.enabled = (loc > 0);
//     if ([keyPath isEqualToString:@"age"] && object == _walker) {
//               _ageLabel.text = [NSString stringWithFormat:@"%@现在的年龄是: %d", _walker.name, _walker.age];
//          }
}
-(void)dealloc
{
//    if (_txtf) {
//        [_txtf removeObserver:self forKeyPath:@"text" context:nil];
//    }
}
@end
