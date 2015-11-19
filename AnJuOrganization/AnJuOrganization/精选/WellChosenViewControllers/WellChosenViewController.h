//
//  WellChosenViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WellChosenViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSMutableArray *houseObjArray;
@end
