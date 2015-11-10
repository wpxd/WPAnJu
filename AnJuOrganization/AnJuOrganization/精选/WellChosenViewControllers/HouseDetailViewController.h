//
//  HouseDetailViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic, strong)UITableView *myTableView;
@property(nonatomic,strong)UIScrollView *headerScrollView;
//@property(nonatomic,strong)UILabel *houseNameLab;
//@property(nonatomic,strong)UILabel *houseTpyeLab;
//@property(nonatomic,strong)UILabel *houseStateLab;
//@property(nonatomic,strong)UILabel *housePriceLab;
//@property(nonatomic,strong)UILabel *houseTimeLab;

@end
