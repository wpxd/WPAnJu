//
//  AllHousesTableViewCell.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/4.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "AllHousesTableViewCell.h"

@implementation AllHousesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _louPanImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 100, 80)];
        [self.contentView addSubview:_louPanImgView];
        _louPanNameLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 5, 130, 20)];
        _louPanNameLab.font = [UIFont systemFontOfSize:15];
        _louPanNameLab.textColor = UIColorFromHex(0x333333);
        _louPanNameLab.text = @"巴丽新地";
        [self.contentView addSubview:_louPanNameLab];
        _louPanDistanceLab = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-70, 10, 60, 15)];
        _louPanDistanceLab.font = [UIFont systemFontOfSize:13];
        _louPanDistanceLab.textAlignment = NSTextAlignmentRight;
        _louPanDistanceLab.textColor = UIColorFromHex(0x666666);
        _louPanDistanceLab.text = @"8.24KM";
        [self.contentView addSubview:_louPanDistanceLab];
        _louPanPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 30, 130, 15)];
        _louPanPriceLab.font = [UIFont systemFontOfSize:13];
        _louPanPriceLab.textColor = UIColorFromHex(0x666666);
        _louPanPriceLab.text = @"均价：15000元/㎡";
        [self.contentView addSubview:_louPanPriceLab];
        _louPanLocationLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 50, kMainScreenWidth-125, 15)];
        _louPanLocationLab.font = [UIFont systemFontOfSize:13];
        _louPanLocationLab.textColor = UIColorFromHex(0x666666);
        _louPanLocationLab.text = @"板块：鄞州";
        [self.contentView addSubview:_louPanLocationLab];
        UILabel *yongLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 70, 28, 18)];
        [yongLab.layer setCornerRadius:3];
        [yongLab.layer setMasksToBounds:YES];
        [yongLab setClipsToBounds:YES];
        yongLab.font = [UIFont systemFontOfSize:13];
        yongLab.textColor = [UIColor whiteColor];
        yongLab.text = @"佣金";
        yongLab.backgroundColor = UIColorFromHex(0xff4800);
        [self.contentView addSubview:yongLab];
        _louPanYongLab = [[UILabel alloc] initWithFrame:CGRectMake(145, 75, 50, 10)];
        _louPanYongLab.font = [UIFont systemFontOfSize:12];
        _louPanYongLab.textColor = UIColorFromHex(0xff4800);
        _louPanYongLab.text = @"￥10000";
        [self.contentView addSubview:_louPanYongLab];
        _louPanTypeLab = [[UILabel alloc] initWithFrame:CGRectMake(195, 70, 55, 18)];
        [_louPanTypeLab.layer setCornerRadius:3];
        _louPanTypeLab.layer.borderWidth = 1;
        _louPanTypeLab.layer.borderColor = [UIColorFromHex(0x27bfb2) CGColor];
        _louPanTypeLab.font = [UIFont systemFontOfSize:13];
        _louPanTypeLab.textColor = UIColorFromHex(0x27bfb2);
        _louPanTypeLab.text = @"普通住宅";
        _louPanTypeLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_louPanTypeLab];
        _louPanStateLab = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-70, 70, 60, 15)];
        _louPanStateLab.textAlignment = NSTextAlignmentRight;
        _louPanStateLab.font = [UIFont systemFontOfSize:12];
        _louPanStateLab.textColor = UIColorFromHex(0x666666);
        _louPanStateLab.text = @"实时界定";
        [self.contentView addSubview:_louPanStateLab];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
