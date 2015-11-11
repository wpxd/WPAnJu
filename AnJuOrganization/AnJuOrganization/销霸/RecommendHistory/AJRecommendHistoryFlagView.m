//
//  AJRecommendHistoryFlagView.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJRecommendHistoryFlagView.h"
@interface AJRecommendHistoryFlagView()
@property (nonatomic ,copy)     NSArray *titles;
@property (nonatomic ,strong)   NSArray *buttons;

@property (nonatomic ,strong)   UIView  *flagView;
@property (nonatomic ,strong)   UIView  *lineView;
@end
@implementation AJRecommendHistoryFlagView

static NSUInteger const xSpace = 10;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeContneView];
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor colorWithHex:0xc3c3c3];
        [self addSubview:_lineView];
        _flagView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 0, 0)];
        _flagView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_flagView];


    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
                [self makeContneView];
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor colorWithHex:0xc3c3c3];
        [self addSubview:_lineView];
        _flagView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 0, 0)];
        _flagView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_flagView];



    }
    return self;
}
- (void)makeContneView{
    if (!self.titles) {
        self.titles = @[@"全部",@"界定中",@"有效",@"无效",@"流失",@"失效"];
    }
    for (UIView *aView in self.buttons) {
        [aView removeFromSuperview];
    }
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:6];
    for (int i = 0; i < self.titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor colorWithHex:0xF9381A] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        [button setTitle:self.titles[i] forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(flagBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:button];
    
        [self addSubview:button];
    }
    
    self.buttons = arr;
    
    UIButton *btn = [self.buttons  firstObject];
    btn.enabled = NO;
    _flagView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 0, 0)];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}

- (void)flagBtnClicked:(UIButton *)btn{
    for (UIButton *btn in  self.buttons) {
        btn.enabled = YES;
    }
    [self selected:[self.buttons indexOfObject:btn]];
    if ([self.delegate respondsToSelector:@selector(flagView:selcetedIndex:)]) {
        [self.delegate flagView:self selcetedIndex:[self.buttons indexOfObject:btn]];
    }
}
- (void)selected:(NSUInteger)index{
    NSAssert(index < self.buttons.count, @"数组越界");
    if (index > self.buttons.count) {
        return;
    }
    for (UIButton *btn in  self.buttons) {
        btn.enabled = YES;
    }
    [UIView animateWithDuration:0.25 animations:^{
        UIButton *btn = [self.buttons objectAtIndex:index];
        btn.enabled = NO;
        NSUInteger flag = [self.buttons indexOfObject:btn];
        CGFloat space = (self.bounds.size.width - 2 * xSpace) / self.buttons.count;
        self.flagView.frame = CGRectMake(xSpace + flag * space, self.bounds.size.height -1, space, 1);

    }];
}
- (void)setCustomTitles:(NSArray *)titles{
    self.titles = titles;
    [self makeContneView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat space = (self.bounds.size.width - 2 * xSpace) / self.buttons.count;
    for (int i = 0; i < self.buttons.count; i++) {
        UIView *aView = self.buttons[i];
        aView.frame = CGRectMake(xSpace + (i * space), 0, space, self.bounds.size.height - 1);
    }
    self.flagView.frame = CGRectMake(self.flagView.frame.origin.x, self.bounds.size.height -1, space, 1);
    self.lineView.frame = CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5);
}
@end
