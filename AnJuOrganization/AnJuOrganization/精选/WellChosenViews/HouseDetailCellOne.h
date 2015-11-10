//
//  HouseDetailCellOne.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/10.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseDetailCellOne : UITableViewCell
@property(nonatomic,strong)UILabel *houseNameLab;
@property(nonatomic,strong)UILabel *houseTypeLab;
@property(nonatomic,strong)UILabel *houseStateLab;
@property(nonatomic,strong)UILabel *housePriceLab;
@property(nonatomic,strong)UILabel *houseTimeLab;
@property(nonatomic,strong)UIButton *guiZheBtn;
@property(nonatomic,strong)UILabel *houseDynamicLab;
- (void)addGouZiImg:(NSArray *)array;

@end
