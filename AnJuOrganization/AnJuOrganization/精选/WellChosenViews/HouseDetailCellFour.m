//
//  HouseDetailCellFour.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/11.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "HouseDetailCellFour.h"

@implementation HouseDetailCellFour

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *locationLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 80, 20)];
        locationLab.font = [UIFont systemFontOfSize:14];
        locationLab.textColor =[UIColor blackColor];
        locationLab.text = @"位置及周边";
        [self.contentView addSubview:locationLab];
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 49, kMainScreenWidth, 0.5)];
        line1.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line1];
        UILabel *placeLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 50, 10)];
        placeLab.font = [UIFont systemFontOfSize:13];
        placeLab.textColor = UIColorFromHex(0x999999);
        placeLab.text = @"地址：";
        [self.contentView addSubview:placeLab];
        _addressLab = [[UILabel alloc] initWithFrame:CGRectMake(55, 60, kMainScreenWidth-60, 10)];
        _addressLab.font = [UIFont systemFontOfSize:13];
        _addressLab.textColor = UIColorFromHex(0x999999);
        _addressLab.text = @"镇海新城骆兴路532-546号";
        [self.contentView addSubview:_addressLab];
        _addressImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 80, kMainScreenWidth-10, 120)];
        _addressImg.image = [UIImage imageNamed:@"1.jpeg"];
        [self.contentView addSubview:_addressImg];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
