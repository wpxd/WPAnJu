//
//  WellChosenTableCell.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/4.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WellChosenTableCell : UITableViewCell
{
    UIImageView *louPanImgView;
    UILabel *louPanName;
    UILabel *louPanPrice;
    UILabel *banKuaiLab;
    UILabel *louPanType;
    UILabel *louPanState;
    UIView *typeView;
    UIView *stateView;
    UILabel *yongJinLab;
    UIView *yongJinView;
}
@property(nonatomic,strong)UIImageView *louPanImgView;
@property(nonatomic,strong)UILabel *louPanName;
@property(nonatomic,strong)UILabel *louPanPrice;
@property(nonatomic,strong)UILabel *banKuaiLab;
@property(nonatomic,strong)UILabel *louPanType;
@property(nonatomic,strong)UILabel *louPanState;
@property(nonatomic,strong)UIView *typeView;
@property(nonatomic,strong)UIView *stateView;
@property(nonatomic,strong)UILabel *yongJinLab;
@property(nonatomic,strong)UIView *yongJinView;
@end
