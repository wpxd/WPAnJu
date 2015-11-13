//
//  RecommdHouseCell.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/13.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "RecommdHouseCell.h"

@implementation RecommdHouseCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _gouImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 20, 20)];
        _gouImgView.image = [UIImage imageNamed:@"quanNomarl"];
        [self.contentView addSubview:_gouImgView];
        _houseName = [[UILabel alloc] initWithFrame:CGRectMake(40, 8, 150, 20)];
        _houseName.font = [UIFont systemFontOfSize:14];
        _houseName.text = @"皇府大厦";
        [self.contentView addSubview:_houseName];
        UILabel *yongLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 35, 25, 15)];
        [yongLab.layer setCornerRadius:3];
        [yongLab.layer setMasksToBounds:YES];
        [yongLab setClipsToBounds:YES];
        yongLab.font = [UIFont systemFontOfSize:12];
        yongLab.textColor = [UIColor whiteColor];
        yongLab.text = @"佣金";
        yongLab.backgroundColor = UIColorFromHex(0xff4800);
        [self.contentView addSubview:yongLab];
        _yongLab = [[UILabel alloc] initWithFrame:CGRectMake(70, 38, 50, 10)];
        _yongLab.font = [UIFont systemFontOfSize:12];
        _yongLab.textColor = UIColorFromHex(0xff4800);
        _yongLab.text = @"￥10000";
        [self.contentView addSubview:_yongLab];
        _typeLab = [[UILabel alloc] initWithFrame:CGRectMake(125, 35, 52, 15)];
        [_typeLab.layer setCornerRadius:3];
        _typeLab.layer.borderWidth = 1;
        _typeLab.layer.borderColor = [UIColorFromHex(0x27bfb2) CGColor];
        _typeLab.font = [UIFont systemFontOfSize:12];
        _typeLab.textColor = UIColorFromHex(0x27bfb2);
        _typeLab.text = @"普通住宅";
        _typeLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_typeLab];
        _staeLab = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-70, 35, 60, 15)];
        _staeLab.textAlignment = NSTextAlignmentRight;
        _staeLab.font = [UIFont systemFontOfSize:12];
        _staeLab.textColor = UIColorFromHex(0x666666);
        _staeLab.text = @"实时界定";
        [self.contentView addSubview:_staeLab];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
