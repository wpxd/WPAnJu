//
//  HouseDetailViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPPageControl.h"
@interface HouseDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    WPPageControl *_pageControl;
    int             _scrollImgViewIndex;
    int             _dragImgViewIndex;
    int             _direction;
    int _count;
    NSTimer *houseDetailTimer;
    NSArray *xiaoGuoTuArray;
}
@property(nonatomic, strong)UITableView *myTableView;
@property(nonatomic,strong)UIScrollView *headerScrollView;
@property(nonatomic,strong)UILabel *yongJinLab;

@end
