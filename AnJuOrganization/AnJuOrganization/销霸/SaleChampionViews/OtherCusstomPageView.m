//
//  OtherCusstomPageView.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/8.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "OtherCusstomPageView.h"
@implementation OtherCusstomPageView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self buildContentView];
    }
    return self;
}
- (void)buildContentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(25, 0, 200, 200)];
    //    _contentView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    [_contentView.layer setCornerRadius:100];
    _contentView.layer.borderWidth = 5;
    _contentView.layer.borderColor = [UIColorFromHex(0x27bfb2) CGColor];
    [self addSubview:_contentView];
    _tuiJianLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 26, 100, 20)];
    _tuiJianLab.font = [UIFont systemFontOfSize:16];
    //    _tuiJianLab.backgroundColor = [UIColor redColor];
    _tuiJianLab.textColor = UIColorFromHex(0x999999);
    _tuiJianLab.textAlignment = NSTextAlignmentCenter;
    _tuiJianLab.text = @"我的财富";
    [_contentView addSubview:_tuiJianLab];
    _recommendNumLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 160, 60)];
    //    _recommendNumLab.backgroundColor = [UIColor orangeColor];
    _recommendNumLab.font = [UIFont systemFontOfSize:40];
    _recommendNumLab.textColor = UIColorFromHex(0xff4800);
    _recommendNumLab.textAlignment = NSTextAlignmentCenter;
    _recommendNumLab.text = @"0.00";
    [_contentView addSubview:_recommendNumLab];
    _todayTuiJianLab = [[UILabel alloc] initWithFrame:CGRectMake(47, 130, 60, 20)];
    //    _todayTuiJianLab.backgroundColor = [UIColor blueColor];
    _todayTuiJianLab.textAlignment = NSTextAlignmentRight;
    _todayTuiJianLab.font = [UIFont systemFontOfSize:14];
    _todayTuiJianLab.textColor = UIColorFromHex(0x999999);
    _todayTuiJianLab.text = @"总资产";
    [_contentView addSubview:_todayTuiJianLab];
    _todayRecommendNumLab = [[UILabel alloc] initWithFrame:CGRectMake(112, 130, 60, 20)];
    //    _todayRecommendNumLab.backgroundColor = [UIColor yellowColor];
    _todayRecommendNumLab.font = [UIFont systemFontOfSize:14];
    _todayRecommendNumLab.textColor = UIColorFromHex(0xff4800);
    _todayRecommendNumLab.text = @"0.00";
    [_contentView addSubview:_todayRecommendNumLab];
    UILabel *chaKanLab = [[UILabel alloc] initWithFrame:CGRectMake(75, 160, 50, 20)];
    //    chaKanLab.backgroundColor = [UIColor orangeColor];
    chaKanLab.font = [UIFont systemFontOfSize:12];
    chaKanLab.textColor = UIColorFromHex(0x999999);
    chaKanLab.textAlignment = NSTextAlignmentCenter;
    chaKanLab.text = @"点击查看";
    [_contentView addSubview:chaKanLab];
    _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _contentBtn.frame = CGRectMake(25, 0, 200, 200);
    [_contentBtn setBackgroundColor:[UIColor clearColor]];
    [_contentBtn.layer setCornerRadius:100];
    [self addSubview:_contentBtn];
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake((250-220)/2.0, 220, 220, 35)];
    [self addSubview:btnView];
//    _recommendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _recommendBtn.frame = CGRectMake(0, 0, 100, 35);
//    [_recommendBtn.layer setCornerRadius:8];
//    [_recommendBtn setBackgroundColor:UIColorFromHex(0xff4800)];
//    _recommendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [_recommendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_recommendBtn setTitle:@"快速推荐" forState:UIControlStateNormal];
//    [btnView addSubview:_recommendBtn];
    
    _daiKanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _daiKanBtn.frame = CGRectMake((220-100)/2.0, 0, 100, 35);
    [_daiKanBtn.layer setCornerRadius:10];
    _daiKanBtn.layer.borderWidth = 2;
    _daiKanBtn.layer.borderColor = [UIColorFromHex(0x27bfb2) CGColor];
    _daiKanBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_daiKanBtn setTitleColor:UIColorFromHex(0x27bfb2) forState:UIControlStateNormal];
    [_daiKanBtn setTitle:@"快速提现" forState:UIControlStateNormal];
    [btnView addSubview:_daiKanBtn];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
