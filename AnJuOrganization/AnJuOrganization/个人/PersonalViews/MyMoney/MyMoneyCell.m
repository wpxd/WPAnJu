//
//  MyMoneyCell.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/11.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "MyMoneyCell.h"

@implementation MyMoneyCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _houseNameLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 20)];
        _houseNameLab.font = [UIFont systemFontOfSize:15];
        _houseNameLab.text = @"格兰晴天";
        [self.contentView addSubview:_houseNameLab];
        _namePhoneLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 200, 10)];
        _namePhoneLab.font = [UIFont systemFontOfSize:13];
        _namePhoneLab.textColor = UIColorFromHex(0x999999);
        _namePhoneLab.text = @"任我行（13888886666）";
        [self.contentView addSubview:_namePhoneLab];
        _yongJinLab = [[UILabel alloc] initWithFrame:CGRectMake(kMainScreenWidth-120, 25, 110, 15)];
        _yongJinLab.font = [UIFont systemFontOfSize:14];
        _yongJinLab.textColor = UIColorFromHex(0xff4800);
        _yongJinLab.textAlignment = NSTextAlignmentRight;
        _yongJinLab.text = @"+5000";
        [self.contentView addSubview:_yongJinLab];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
