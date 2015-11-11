//
//  MyMoneyViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/11.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJDBezierCurve.h"
@interface MyMoneyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIView *headView;
}
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)CATextLayer *moneyLab;
@end
