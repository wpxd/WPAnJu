//
//  RecommendCell.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/13.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "RecommendCell.h"

@implementation RecommendCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _houseName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 150, 20)];
        _houseName.font = [UIFont systemFontOfSize:14];
        _houseName.text = @"皇府大厦";
        [self.contentView addSubview:_houseName];
        UILabel *yongLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 25, 15)];
        [yongLab.layer setCornerRadius:3];
        [yongLab.layer setMasksToBounds:YES];
        [yongLab setClipsToBounds:YES];
        yongLab.font = [UIFont systemFontOfSize:12];
        yongLab.textColor = [UIColor whiteColor];
        yongLab.text = @"佣金";
        yongLab.backgroundColor = UIColorFromHex(0xff4800);
        [self.contentView addSubview:yongLab];
        _yongLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 33, 50, 10)];
        _yongLab.font = [UIFont systemFontOfSize:12];
        _yongLab.textColor = UIColorFromHex(0xff4800);
        _yongLab.text = @"￥10000";
        [self.contentView addSubview:_yongLab];
        _typeLab = [[UILabel alloc] initWithFrame:CGRectMake(95, 30, 52, 15)];
        [_typeLab.layer setCornerRadius:3];
        _typeLab.layer.borderWidth = 1;
        _typeLab.layer.borderColor = [UIColorFromHex(0x27bfb2) CGColor];
        _typeLab.font = [UIFont systemFontOfSize:12];
        _typeLab.textColor = UIColorFromHex(0x27bfb2);
        _typeLab.text = @"普通住宅";
        _typeLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_typeLab];
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(kMainScreenWidth-40, 12.5, 30, 30);
        [self.contentView addSubview:_deleteBtn];
        UIImageView *deleteImg = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-35, 15, 20, 20)];
        deleteImg.image = [UIImage imageNamed:@"deletHous"];
        [self.contentView addSubview:deleteImg];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
