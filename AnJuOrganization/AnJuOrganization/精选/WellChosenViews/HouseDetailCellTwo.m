//
//  HouseDetailCellTwo.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/10.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "HouseDetailCellTwo.h"

@implementation HouseDetailCellTwo

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *xiangQingLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 80, 20)];
        xiangQingLab.font = [UIFont systemFontOfSize:14];
        xiangQingLab.textColor =[UIColor blackColor];
        xiangQingLab.text = @"楼盘详情";
        [self.contentView addSubview:xiangQingLab];
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 49, kMainScreenWidth, 0.5)];
        line1.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line1];
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 99, kMainScreenWidth, 0.5)];
        line2.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line2];
        UILabel *zhiXunLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 65, 70, 20)];
        zhiXunLab.font = [UIFont systemFontOfSize:13];
        zhiXunLab.textColor = UIColorFromHex(0x333333);
        zhiXunLab.text = @"质询电话：";
        [self.contentView addSubview:zhiXunLab];
        _telphoneLab = [[UILabel alloc] initWithFrame:CGRectMake(73, 66, 100, 20)];
        _telphoneLab.textColor = UIColorFromHex(0x333333);
        _telphoneLab.font = [UIFont systemFontOfSize:13];
        _telphoneLab.text = @"13056806969";
        [self.contentView addSubview:_telphoneLab];
        UIImageView *telphoneImg = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-25, 65, 15, 15)];
        telphoneImg.image = [UIImage imageNamed:@"telphone"];
        [self.contentView addSubview:telphoneImg];
        _telphoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _telphoneBtn.frame = CGRectMake(0, 50, kMainScreenWidth, 50);
        [self.contentView addSubview:_telphoneBtn];
        UILabel *maiDianLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 110, 70, 20)];
        maiDianLab.font = [UIFont systemFontOfSize:13];
        maiDianLab.textColor = UIColorFromHex(0x333333);
        maiDianLab.text = @"楼盘卖点";
        [self.contentView addSubview:maiDianLab];
        _buyPointLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _buyPointLab.textColor = UIColorFromHex(0x999999);
        [_buyPointLab setLineBreakMode:NSLineBreakByWordWrapping];
        [_buyPointLab setMinimumScaleFactor:13];
        [_buyPointLab setNumberOfLines:0];
        [_buyPointLab setFont:[UIFont systemFontOfSize:13]];
        _buyPointLab.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
//        _buyPointLab.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_buyPointLab];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
