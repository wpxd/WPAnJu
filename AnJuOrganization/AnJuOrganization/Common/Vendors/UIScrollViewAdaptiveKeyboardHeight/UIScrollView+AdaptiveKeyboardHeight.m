//
//  UIScrollView+AdaptiveKeyboardHeight.m
//  XDWenger
//
//  Created by 张旭东 on 15/9/17.
//  Copyright © 2015年 张旭东. All rights reserved.
//

#import "UIScrollView+AdaptiveKeyboardHeight.h"
#import <objc/runtime.h>
#define _UIKeyboardFrameEndUserInfoKey (&UIKeyboardFrameEndUserInfoKey != NULL ? UIKeyboardFrameEndUserInfoKey : @"UIKeyboardBoundsUserInfoKey")

#pragma mark- KeyBoardTaget
typedef UIScrollView * (^targetSrollview)(void) ;
@protocol KeyBoardTaget <NSObject>
@property (nonatomic ,strong)targetSrollview keyBoardScrollView;
- (void)setIsObserver:(BOOL)isObserver;
@end

#pragma mark- KeyBoardScrollViewTarget statement
@interface KeyBoardScrollViewTarget : NSObject <KeyBoardTaget>
@property (nonatomic ,strong)targetSrollview keyBoardScrollView;
@end


#pragma mark- scrollview category  KeyBoardTaget
@interface UIScrollView  (KeyBoardTaget)
@property (nonatomic ,strong)id<KeyBoardTaget> target;
@end

@implementation UIScrollView (KeyBoardTaget)

- (id<KeyBoardTaget>)target{
    return objc_getAssociatedObject(self, _cmd) ;
}
- (void)setTarget:(id<KeyBoardTaget>)target{
    objc_setAssociatedObject(self, @selector(target), target,OBJC_ASSOCIATION_RETAIN);
}

@end
#pragma mark- scrollview category  AdaptiveKeyboardHeight

@implementation UIScrollView (AdaptiveKeyboardHeight)


+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(touchesEnded:withEvent:);
        SEL swizzledSelector = @selector(keyBoardTouchesEnded:withEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),  (char *)(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        
    });

}

- (void)setAutoAdaptiveKeyBoard:(BOOL)autoAdaptiveKeyBoard{
    
    self.target =  [[KeyBoardScrollViewTarget alloc]init];
    __weak UIScrollView *weakSelf = self;
    self.target.keyBoardScrollView = ^{return weakSelf;};
//    [self addObserver:self.target forKeyPath:@"autoAdaptiveKeyBoard" options:NSKeyValueObservingOptionNew context:nil];
    [self willChangeValueForKey:@"autoAdaptiveKeyBoard"];
    objc_setAssociatedObject(self, @selector(autoAdaptiveKeyBoard), @(autoAdaptiveKeyBoard), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"autoAdaptiveKeyBoard"];
    [self.target setIsObserver:autoAdaptiveKeyBoard];
}

- (BOOL)autoAdaptiveKeyBoard{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}


/**
 *  照当当前tableView的响应view
 *
 */

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
- (void)keyBoardTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self findFirstResponderBeneathView:self] resignFirstResponder];
    [self keyBoardTouchesEnded:touches withEvent:event];
}

- (void)subViewresigenFirstResponder{
    [[self findFirstResponderBeneathView:self] resignFirstResponder];
}

@end

#pragma mark- KeyBoardScrollViewTarget implementation

@interface KeyBoardScrollViewTarget ()

@property (nonatomic ,assign)BOOL keyboardVisible;
@property (nonatomic ,assign)CGRect keyboardRect;
@property (nonatomic ,assign)UIEdgeInsets priorInset;
@property (nonatomic ,assign)BOOL priorInsetSaved;
@property (nonatomic ,assign)CGPoint originContentOffset;
@end

@implementation KeyBoardScrollViewTarget

@synthesize keyBoardScrollView = _keyBoardScrollView;


//- (void)setKeyBoardScrollView:(UIScrollView *)keyBoardScrollView{
//    _keyBoardScrollView = keyBoardScrollView;
//}


- (void)setIsObserver:(BOOL)isObserver{
    if (isObserver)
        [self addKeyBoardObserver];
    else
        [self removeKeyBoardObserver];
}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//    if ([keyPath isEqualToString:@"autoAdaptiveKeyBoard"]) {
//       BOOL isObserver = [[change valueForKey:NSKeyValueChangeNewKey] boolValue];
//        if (isObserver)
//           [self addKeyBoardObserver];
//        else
//            [self removeKeyBoardObserver];
//    }
//}
- (void)addKeyBoardObserver{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //键盘将要出现时的触发事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:)name:UIKeyboardWillShowNotification object:nil];
    //键盘将要消失时的触发事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];
}
- (void)removeKeyBoardObserver{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    }

#pragma mark -dealloc
- (void)keyboardWillShow:(NSNotification*)notification {
    self.keyboardRect = [[[notification userInfo] objectForKey:_UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardVisible = YES;
   
    UIView *firstResponder = [self.keyBoardScrollView() findFirstResponderBeneathView:self.keyBoardScrollView()];
    if ( !firstResponder ) {
        // No child view is the first responder - nothing to do here
        return;
    }
    
    if (!self.priorInsetSaved) {
        self.priorInset = self.keyBoardScrollView().contentInset;
        self.priorInsetSaved = YES;
        self.originContentOffset = self.keyBoardScrollView().contentOffset;
    }
    
    // Shrink view's inset by the keyboard's height, and scroll to show the text field/view being edited
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
        [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
        self.keyBoardScrollView().contentInset = [self contentInsetForKeyboard];
        
        [self.keyBoardScrollView() setContentOffset:
         CGPointMake(self.keyBoardScrollView().contentOffset.x,
        [self idealOffsetForView:firstResponder
                       withSpace:
         
         [self keyboardRect].origin.y - self.keyBoardScrollView().bounds.origin.y])
                                           animated:NO];
 
        [UIView commitAnimations];
   
   
}

- (void)keyboardWillHide:(NSNotification*)notification {
    self.keyboardRect = CGRectZero;
    self.keyboardVisible = NO;
    if (!self.keyBoardScrollView().superview) return;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
        [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
    
        self.keyBoardScrollView().contentOffset = self.originContentOffset;
        self.keyBoardScrollView().contentInset = self.priorInset;
        self.priorInsetSaved = NO;
        [UIView commitAnimations];
    
   
}

- (UIEdgeInsets)contentInsetForKeyboard
{
    UIEdgeInsets newInset =  self.keyBoardScrollView().contentInset;
    CGRect keyboardRect = [self keyboardRect];
    newInset.bottom = keyboardRect.size.height - ((keyboardRect.origin.y+keyboardRect.size.height) - ( self.keyBoardScrollView().bounds.origin.y + self.keyBoardScrollView().bounds.size.height) );

    return newInset;
}


- (CGRect)keyboardRect
{
    CGRect keyboardRect = [ self.keyBoardScrollView() convertRect:_keyboardRect fromView:nil];
    if (keyboardRect.origin.y == 0 ) {
        CGRect screenBounds = [ self.keyBoardScrollView() convertRect:[UIScreen mainScreen].bounds fromView:nil];
        keyboardRect.origin = CGPointMake(0, screenBounds.size.height - keyboardRect.size.height);
    }
    return keyboardRect;
}

-(CGFloat)idealOffsetForView:(UIView *)view withSpace:(CGFloat)space
{
    CGRect rect = [view convertRect:view.bounds toView: self.keyBoardScrollView()];
    CGFloat offset = rect.origin.y;
    //modify by gus 阻止输入区域的底部空间区域也显示出来
    if (view.bounds.size.height < space ) {
        offset = self.keyBoardScrollView().contentOffset.y;
    }
    
    if (offset + space > self.keyBoardScrollView().contentSize.height ) {
        offset =  self.keyBoardScrollView().contentSize.height - space;
    }
    
    if ([view isKindOfClass:[UITextView class]]) {
        if (rect.size.height + rect.origin.y - self.keyBoardScrollView().contentOffset.y < self.keyBoardScrollView().contentOffset.y + space) {
             return offset;
        }
        offset =   (rect.size.height + rect.origin.y - self.keyBoardScrollView().contentOffset.y) - self.keyBoardScrollView().contentOffset.y - space;
    }
    
    if (offset < 0) offset = 0;
    return offset;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
