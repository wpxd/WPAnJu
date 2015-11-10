//
//  YSKeyboardTableView.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "YSKeyboardTableView.h"


#import "YSKeyboardTableView.h"
#define _UIKeyboardFrameEndUserInfoKey (&UIKeyboardFrameEndUserInfoKey != NULL ? UIKeyboardFrameEndUserInfoKey : @"UIKeyboardBoundsUserInfoKey")

@interface YSKeyboardTableView()

- (UIView*)findFirstResponderBeneathView:(UIView*)view;
- (UIEdgeInsets)contentInsetForKeyboard;
- (CGFloat)idealOffsetForView:(UIView *)view withSpace:(CGFloat)space;
- (CGRect)keyboardRect;
@end

@implementation YSKeyboardTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    CGSize contentSize = _originalContentSize;
    contentSize.width = MAX(contentSize.width, self.frame.size.width);
    contentSize.height = MAX(contentSize.height, self.frame.size.height);
    [super setContentSize:contentSize];
    
    if ( _keyboardVisible ) {
        self.contentInset = [self contentInsetForKeyboard];
    }
}

-(void)setContentSize:(CGSize)contentSize {
    _originalContentSize = contentSize;
    
    contentSize.width = MAX(contentSize.width, self.frame.size.width);
    contentSize.height = MAX(contentSize.height, self.frame.size.height);
    [super setContentSize:contentSize];
    
    if ( _keyboardVisible ) {
        self.contentInset = [self contentInsetForKeyboard];
    }
}

- (void)setup {
    _extraKeyboardHeight = 0;
    _priorInsetSaved = NO;
    if ( CGSizeEqualToSize(self.contentSize, CGSizeZero) ) {
        self.contentSize = self.bounds.size;
    }
    
#ifdef __IPHONE_5_0
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >=5.0)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
#endif
    
    //键盘将要出现时的触发事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:)name:UIKeyboardWillShowNotification object:nil];
    
    //键盘将要消失时的触发事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification {
    _keyboardRect = [[[notification userInfo] objectForKey:_UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _keyboardRect = CGRectMake(_keyboardRect.origin.x, _keyboardRect.origin.y - _extraKeyboardHeight, _keyboardRect.size.width, _keyboardRect.size.height + _extraKeyboardHeight);
    _keyboardVisible = YES;
    
    UIView *firstResponder = [self findFirstResponderBeneathView:self];
    if ( !firstResponder ) {
        // No child view is the first responder - nothing to do here
        return;
    }
    
    if (!_priorInsetSaved) {
        _priorInset = self.contentInset;
        _priorInsetSaved = YES;
    }
    
    // Shrink view's inset by the keyboard's height, and scroll to show the text field/view being edited
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
    [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
    
    self.contentInset = [self contentInsetForKeyboard];
    [self setContentOffset:CGPointMake(self.contentOffset.x,
                                       [self idealOffsetForView:firstResponder withSpace:[self keyboardRect].origin.y - self.bounds.origin.y])
                  animated:YES];
    
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification*)notification {
    _keyboardRect = CGRectZero;
    _keyboardVisible = NO;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
    [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
    self.contentInset = _priorInset;
    _priorInsetSaved = NO;
    [UIView commitAnimations];
}

- (UIEdgeInsets)contentInsetForKeyboard
{
    UIEdgeInsets newInset = self.contentInset;
    CGRect keyboardRect = [self keyboardRect];
    newInset.bottom = keyboardRect.size.height - ((keyboardRect.origin.y+keyboardRect.size.height) - (self.bounds.origin.y+self.bounds.size.height));
    return newInset;
}

- (CGRect)keyboardRect
{
    CGRect keyboardRect = [self convertRect:_keyboardRect fromView:nil];
    if ( keyboardRect.origin.y == 0 ) {
        CGRect screenBounds = [self convertRect:[UIScreen mainScreen].bounds fromView:nil];
        keyboardRect.origin = CGPointMake(0, screenBounds.size.height - keyboardRect.size.height);
    }
    return keyboardRect;
}

-(void)adjustOffsetIfNeeded
{
    // Only do this if the keyboard is already visible
    if ( !_keyboardVisible ) return;
    
    CGFloat visibleSpace = self.bounds.size.height - self.contentInset.top - self.contentInset.bottom;
    
    CGPoint idealOffset = CGPointMake(0, [self idealOffsetForView:[self findFirstResponderBeneathView:self] withSpace:visibleSpace]);
    
    [self setContentOffset:idealOffset animated:YES];
}

- (UIView*)findFirstResponderBeneathView:(UIView*)view
{
    for ( UIView *childView in view.subviews )
    {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] ) return childView;
        UIView *result = [self findFirstResponderBeneathView:childView];
        if ( result ) return result;
    }
    return nil;
}

-(CGFloat)idealOffsetForView:(UIView *)view withSpace:(CGFloat)space
{
    
    // Convert the rect to get the view's distance from the top of the scrollView.
    CGRect rect = [view convertRect:view.bounds toView:self];
    
    // Set starting offset to that point
    CGFloat offset = rect.origin.y;
    
    //modify by gus 阻止输入区域的底部空间区域也显示出来
    //    if ( self.contentSize.height - offset < space )
    //    {
    //        // Scroll to the bottom
    //        offset = self.contentSize.height - space;
    //    }
    //    else
    //    {
    if ( view.bounds.size.height < space ) {
        // Center vertically if there's room
        offset -= floor((space-view.bounds.size.height)/2.0);
    }
    if ( offset + space > self.contentSize.height ) {
        // Clamp to content size
        offset = self.contentSize.height - space;
    }
    //    }
    //modify end
    if (offset < 0) offset = 0;
    
    return offset;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self findFirstResponderBeneathView:self] resignFirstResponder];
    [super touchesEnded:touches withEvent:event];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end


