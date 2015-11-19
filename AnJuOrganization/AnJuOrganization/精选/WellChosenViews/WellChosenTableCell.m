//
//  WellChosenTableCell.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/4.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "WellChosenTableCell.h"

@implementation WellChosenTableCell
@synthesize louPanImgView,louPanName,louPanPrice,banKuaiLab,louPanType,louPanState,typeView,stateView,yongJinLab,yongJinView;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        louPanImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 150)];
        [self.contentView addSubview:louPanImgView];
        louPanName = [[UILabel alloc] initWithFrame:CGRectMake(10, 158, 150, 20)];
        louPanName.font = [UIFont systemFontOfSize:14];
        louPanName.textColor = UIColorFromHex(0x333333);
        louPanName.text = @"中海阳光玫瑰园";
        [self.contentView addSubview:louPanName];
        louPanPrice = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-160, 158, 150, 20)];
        louPanPrice.textAlignment = NSTextAlignmentRight;
        louPanPrice.font = [UIFont systemFontOfSize:15];
        louPanPrice.textColor = UIColorFromHex(0xff4800);
        louPanPrice.text = @"均价：14000元/㎡";
        [self.contentView addSubview:louPanPrice];
        banKuaiLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, kMainScreenWidth-20, 20)];
        banKuaiLab.font = [UIFont systemFontOfSize:13];
        banKuaiLab.textColor = UIColorFromHex(0x666666);
        banKuaiLab.text = @"板块：东钱湖板块";
        [self.contentView addSubview:banKuaiLab];
        typeView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 90, 30)];
        typeView.backgroundColor = UIColorFromHex(0x27bfb2);
        [self.contentView addSubview:typeView];
        louPanType = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 80, 20)];
        louPanType.textAlignment = NSTextAlignmentCenter;
        louPanType.textColor = [UIColor whiteColor];
        louPanType.font = [UIFont systemFontOfSize:14];
        louPanType.text = @"酒店式公寓";
        [typeView addSubview:louPanType];
        stateView = [[UIView alloc] initWithFrame:CGRectMake(110, 0, 40, 30)];
        stateView.backgroundColor = UIColorFromHex(0x27bfb2);
        [self.contentView addSubview:stateView];
        louPanState = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 30, 20)];
        louPanState.textAlignment = NSTextAlignmentCenter;
        louPanState.textColor = [UIColor whiteColor];
        louPanState.font = [UIFont systemFontOfSize:14];
        louPanState.text = @"现房";
        [stateView addSubview:louPanState];
        yongJinView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth-100, 120, 90, 30)];
        yongJinView.backgroundColor = UIColorFromHex(0x000000);
        yongJinView.alpha = 0.7;
        [self.contentView addSubview:yongJinView];
        yongJinLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 80, 20)];
        yongJinLab.font = [UIFont systemFontOfSize:14];
        yongJinLab.textColor = [UIColor whiteColor];
        yongJinLab.textAlignment = NSTextAlignmentCenter;
        yongJinLab.text = @"佣金：待定";
        [yongJinView addSubview:yongJinLab];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
