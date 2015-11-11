//
//  HouseDetailCellThree.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/10.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "HouseDetailCellThree.h"

@implementation HouseDetailCellThree

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *huXingLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 80, 20)];
        huXingLab.font = [UIFont systemFontOfSize:14];
        huXingLab.textColor =[UIColor blackColor];
        huXingLab.text = @"主力户型";
        [self.contentView addSubview:huXingLab];
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 49, kMainScreenWidth, 0.5)];
        line1.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.contentView addSubview:line1];
    }
    return self;
}
- (void)buildHuXingScrollView:(NSArray *)huXingArray
{
    UIScrollView *imgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 55, kMainScreenWidth-10, 140)];
    imgScrollView.backgroundColor = [UIColor purpleColor];
    imgScrollView.contentSize = CGSizeMake((120 * huXingArray.count-20), 140);
    imgScrollView.bounces = NO;
    imgScrollView.showsHorizontalScrollIndicator = NO;
    imgScrollView.pagingEnabled = NO;
    [self.contentView addSubview:imgScrollView];
    for (int i = 0; i < huXingArray.count; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(120*i, 0, 100, 120)];
        imgView.backgroundColor = [UIColor redColor];
        [imgScrollView addSubview:imgView];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
