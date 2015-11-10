//
//  AJCustomerLeveal.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJCustomerLevealView.h"

@interface AJCustomerLevealView ()

@property (nonatomic ,strong)NSMutableArray *levealArr;
@property (nonatomic ,strong)UIView *progressBGView;
@property (nonatomic ,strong)UIView *flagView;
@end
@implementation AJCustomerLevealView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeUpLeveal];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self makeUpLeveal];
    }
    return self;
    
}

- (void)makeUpLeveal{
    self.levealTitleArr = @[@"E",@"D",@"C",@"B",@"A"];
    for (UIView *aView in self.levealArr) {
        [aView removeFromSuperview];
    }
    
    self.levealArr = [[NSMutableArray alloc]initWithCapacity:5];
    for (int i = 0; i < self.levealTitleArr.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        
        label.textColor = [UIColor colorWithHex:0xc3c3c3];
        label.font = [UIFont systemFontOfSize:15];
        label.text = self.levealTitleArr[i];
        [self addSubview:label];
        [self.levealArr addObject:label];
    }
    if (!self.progressBGView) {
        self.progressBGView = [[UIView alloc]init];
        self.progressBGView.backgroundColor = [UIColor colorWithHex:0XF59C1D];
        [self addSubview:self.progressBGView];
    }
   
    if (!self.flagView) {
        self.flagView = [[UIView alloc]initWithFrame:CGRectZero];
        self.flagView.backgroundColor = [UIColor redColor];
        [self addSubview:self.flagView];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerPan:)];
        [self.flagView addGestureRecognizer:panGesture];
    }
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat labelWidth  = 16;
    CGFloat labelSpace = (width - self.levealArr.count * labelWidth) / MAX(1, self.levealArr.count - 1);
    for (int i = 0; i < self.levealArr.count; i++) {
        UILabel *levaelLabel = self.levealArr[i];
       
        levaelLabel.frame = CGRectMake(labelSpace * i + labelWidth * i,
                                       height - labelWidth - 2,
                                       labelWidth,
                                       labelWidth);
    }
    self.progressBGView.frame = CGRectMake(6, 10, width - 16, 10);
    self.flagView.frame = CGRectMake(self.flagView.frame.origin.x, 1, 20, 30);
}

- (void)panGestureRecognizerPan:(UIPanGestureRecognizer *)panGestureRecognizer{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        
        CGFloat x = MIN(view.center.x + translation.x, view.superview.bounds.size.width - 8 - view.bounds.size.width / 2);
        x = MAX(6, x);
        
        [view setCenter:(CGPoint){x, view.center.y }];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded || panGestureRecognizer.state == UIGestureRecognizerStateCancelled ){
        CGFloat x = view.center.x;
        NSUInteger levealCount  = self.levealTitleArr.count;
        NSUInteger spaceCount  = MAX(levealCount - 1, 1);
        CGFloat space = self.progressBGView.frame.size.width / spaceCount;
        int   leveal  = x / space;
        if ( ABS(leveal * space - x) > space / 2)
            leveal += 1;
        
        x = space * leveal;
        x = MIN(x, view.superview.bounds.size.width - 8 - view.bounds.size.width / 2);
        x = MAX(6, x);
        [UIView animateWithDuration:0.25 animations:^{
            view.center = CGPointMake(x, view.center.y);
        }];
        
    }
}

- (void)setLevealTitleArr:(NSArray *)levealArr{
    _levealArr = [levealArr copy];
    [self makeUpLeveal];
}



- (void)setLeveal:(NSUInteger)leveal animated:(BOOL)animated{
    NSUInteger levealCount  = self.levealTitleArr.count;
    NSUInteger spaceCount  = MAX(levealCount - 1, 1);
    CGFloat space = self.progressBGView.frame.size.width / spaceCount;
    CGFloat x = space * leveal;
    x = MIN(x, self.superview.bounds.size.width - 8 - self.flagView.bounds.size.width / 2);
    x = MAX(6, x);
    if (!animated) {
        self.flagView.center = CGPointMake(x, self.flagView.center.y);
        _leveal = leveal;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.flagView.center = CGPointMake(x, self.flagView.center.y);
    }];
}
@end
