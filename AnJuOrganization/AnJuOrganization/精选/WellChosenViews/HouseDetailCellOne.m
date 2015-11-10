//
//  HouseDetailCellOne.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/10.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "HouseDetailCellOne.h"

@implementation HouseDetailCellOne

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _houseNameLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 105, 20)];
        _houseNameLab.font = [UIFont systemFontOfSize:15];
        _houseNameLab.text = @"中海阳光玫瑰园";
        [self.contentView addSubview:_houseNameLab];
        _houseTypeLab = [[UILabel alloc] initWithFrame:CGRectMake(118, 13, 75, 15)];
        _houseTypeLab.font = [UIFont systemFontOfSize:12];
        _houseTypeLab.backgroundColor = UIColorFromHex(0xff4800);
        _houseTypeLab.textColor = [UIColor whiteColor];
        [_houseTypeLab.layer setCornerRadius:3];
        [_houseTypeLab.layer setMasksToBounds:YES];
        _houseTypeLab.textAlignment = NSTextAlignmentCenter;
        _houseTypeLab.text = @"酒店式公寓";
        [self.contentView addSubview:_houseTypeLab];
        _houseStateLab = [[UILabel alloc] initWithFrame:CGRectMake(203, 13, 35, 15)];
        _houseStateLab.font = [UIFont systemFontOfSize:12];
        _houseStateLab.backgroundColor = UIColorFromHex(0xff4800);
        _houseStateLab.textColor = [UIColor whiteColor];
        [_houseStateLab.layer setCornerRadius:3];
        [_houseStateLab.layer setMasksToBounds:YES];
        _houseStateLab.textAlignment = NSTextAlignmentCenter;
        _houseStateLab.text = @"现房";
        [self.contentView addSubview:_houseStateLab];
        _housePriceLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 105, 15)];
        _housePriceLab.font = [UIFont systemFontOfSize:13];
        _housePriceLab.textColor = UIColorFromHex(0xff4800);
        _housePriceLab.text = @"均价：14000/㎡";
        [self.contentView addSubview:_housePriceLab];
        _houseTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-190, 40, 185, 15)];
        _houseTimeLab.font = [UIFont systemFontOfSize:12];
        _houseTimeLab.textColor = UIColorFromHex(0x999999);
        _houseTimeLab.textAlignment = NSTextAlignmentRight;
        _houseTimeLab.text = @"有效期:2015-07-31至2015-09-24";
        [self.contentView addSubview:_houseTimeLab];
        [self addGouZiImg:nil];
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, kMainScreenWidth, 0.5)];
        line1.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line1];
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 140, kMainScreenWidth, 0.5)];
        line2.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line2];
        UILabel *guiZheLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 105, 80, 20)];
        guiZheLab.font = [UIFont systemFontOfSize:14];
        guiZheLab.textColor = UIColorFromHex(0x333333);
        guiZheLab.text = @"推荐规则";
        [self.contentView addSubview:guiZheLab];
        UIImageView *jianTouImg = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-15, 109, 8, 10)];
        jianTouImg.image = [UIImage imageNamed:@"jianTou"];
        [self.contentView addSubview:jianTouImg];
        
        _guiZheBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _guiZheBtn.frame = CGRectMake(0, 90, kMainScreenWidth, 50);
        [self.contentView addSubview:_guiZheBtn];
        UILabel *dongTaiLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 150, 80, 20)];
        dongTaiLab.font = [UIFont systemFontOfSize:14];
        dongTaiLab.textColor = UIColorFromHex(0x333333);
        dongTaiLab.text = @"楼盘动态";
        [self.contentView addSubview:dongTaiLab];
        _houseDynamicLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _houseDynamicLab.textColor = UIColorFromHex(0x999999);
        [_houseDynamicLab setLineBreakMode:NSLineBreakByWordWrapping];
        [_houseDynamicLab setMinimumScaleFactor:13];
        [_houseDynamicLab setNumberOfLines:0];
        [_houseDynamicLab setFont:[UIFont systemFontOfSize:13]];
        _houseDynamicLab.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
//        _houseDynamicLab.backgroundColor = [UIColor redColor];
//        _houseDynamicLab.text = @"的卡号打打卡是的哈客户的卡号的卡号SD卡撒的卡号说电话卡HD声卡和低价位得噢积分我都去偶的我七号定位好的定期维护地区厚底我地区和地区和地区和地区厚底董卿和大红大全东区活动秦皇岛地区和无误后分红网红的话我去活动群活动我的厚度";
        [self.contentView addSubview:_houseDynamicLab];
    }
    return self;
}
- (void)addGouZiImg:(NSArray *)array
{
    NSArray *texts = [NSArray arrayWithObjects:@"成交奖",@"须带看",@"带看奖",@"认筹奖",@"需7天内", nil];
    for (int i =0; i<5; i++)
    {
        UIImageView *gouZiImg = [[UIImageView alloc] initWithFrame:CGRectMake(5+((55+(kMainScreenWidth-10-275)/4.0)*i), 67, 13, 13)];
        gouZiImg.image = [UIImage imageNamed:@"gouZiLight"];
        [self.contentView addSubview:gouZiImg];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20+(55+(kMainScreenWidth-10-275)/4.0)*i, 66, 40, 15)];
//        label.backgroundColor = [UIColor redColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = UIColorFromHex(0x999999);
        label.text = [texts objectAtIndex:i];
        [self.contentView addSubview:label];
//        if ([str isEqualToString:@"yes"])
//        {
//            
//        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
