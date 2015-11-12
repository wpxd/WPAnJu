//
//  SaleChampionViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//
#define kSocailBtnWidth kMainScreenWidth/3.0
#define kSocailBtnX (kSocailBtnWidth-50)/2.0
#import "SaleChampionViewController.h"
#import "CusstomPageView.h"
#import "OtherCusstomPageView.h"
#import "AllHousesViewController.h"
#import "AJCustomerListTableViewController.h"
#import "AJRecommendHistoryListViewController.h"
#import "MyMoneyViewController.h"
#import "RecommentViewController.h"
@interface SaleChampionViewController ()

@end

@implementation SaleChampionViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabbarIndex = 2;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [Common nagationItemTitleView:@"安居经纪"];
    self.view.backgroundColor = [UIColor whiteColor];
    _hFlowView = [[WPPagedFlowView alloc] initWithFrame:CGRectMake(0, 30, kMainScreenWidth, 260)];
    _hFlowView.backgroundColor = [UIColor whiteColor];
    _hFlowView.delegate = self;
    _hFlowView.dataSource = self;
    _hFlowView.minimumPageAlpha = 0.1;
    _hFlowView.minimumPageScale = 1;
    [self.view addSubview:_hFlowView];
    [self buildSubBtnViews];
}
- (void)buildSubBtnViews
{
    NSArray *imgArray = [NSArray arrayWithObjects:@"allHouses",@"managerClient",@"myPlease",@"myMoeny",@"recomendHistory",@"myHouse", nil];
    NSArray *labArray = [NSArray arrayWithObjects:@"所有楼盘",@"客户管理",@"我的申请",@"我的佣金",@"推荐历史",@"我的楼盘", nil];
    for (int i=0; i<imgArray.count; i++)
    {
        UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        subBtn.frame = CGRectMake(kSocailBtnX+(i%3)*kSocailBtnWidth, 324+(i/3)*110, 50, 60);
        subBtn.tag = i+100;
        [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:subBtn];
        UIImageView *socailImg = [[UIImageView alloc] initWithFrame:CGRectMake(kSocailBtnX+(i%3)*kSocailBtnWidth, 325+(i/3)*110, 50, 50)];
        socailImg.image = [UIImage imageNamed:[imgArray objectAtIndex:i]];
        [self.view addSubview:socailImg];
        UILabel *subLab = [[UILabel alloc] initWithFrame:CGRectMake((kSocailBtnWidth-60)/2.0+(i%3)*kSocailBtnWidth, 385+(i/3)*110, 60, 10)];
        subLab.backgroundColor = [UIColor clearColor];
        subLab.font = [UIFont systemFontOfSize:13];
        subLab.textColor = UIColorFromHex(0x666666);
        subLab.textAlignment = NSTextAlignmentCenter;
        subLab.text = [labArray objectAtIndex:i];
        [self.view addSubview:subLab];
    }
}
- (void)subBtnClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag)
    {
        case 100:
        {
            AllHousesViewController *allHousesVC = [[AllHousesViewController alloc] init];
            allHousesVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:allHousesVC animated:YES];
        }
            break;
        case 101:
        {
            AJCustomerListTableViewController *customerManagetVC = [[AJCustomerListTableViewController alloc] init];
            customerManagetVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:customerManagetVC animated:YES];
        }
            break;
        case 103:
        {
            MyMoneyViewController *myMoney = [[MyMoneyViewController alloc] init];
            myMoney.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myMoney animated:YES];
        }
            break;
        case 104:
        {
            AJRecommendHistoryListViewController *customerManagetVC = [[AJRecommendHistoryListViewController alloc] init];
            customerManagetVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:customerManagetVC animated:YES];
        }
            break;

            
        default:
            break;
    }
}
#pragma mark -
#pragma mark PagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(WPPagedFlowView *)flowView;{
    return CGSizeMake(250, 260);
}
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(WPPagedFlowView *)flowView {
    NSLog(@"Scrolled to page # %ld", (long)pageNumber);
    if (pageNumber!=1)
    {
        [UIView animateWithDuration:0.2 animations:^{
            CusstomPageView *contentView = [flowView.cells objectAtIndex:1];
            contentView.recommendBtn.alpha = 0;
            contentView.daiKanBtn.alpha = 0;
            OtherCusstomPageView *contentView1 = [flowView.cells objectAtIndex:0];
//            contentView1.recommendBtn.alpha = 1;
            contentView1.daiKanBtn.alpha = 1;
        }];
        
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            CusstomPageView *contentView = [flowView.cells objectAtIndex:1];
            contentView.recommendBtn.alpha = 1;
            contentView.daiKanBtn.alpha = 1;
            OtherCusstomPageView *contentView1 = [flowView.cells objectAtIndex:0];
//            contentView1.recommendBtn.alpha = 0;
            contentView1.daiKanBtn.alpha = 0;
        }];
       
    }
    
}
#pragma mark -
#pragma mark PagedFlowView Datasource
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(WPPagedFlowView *)flowView{
    return 2;
}

//返回给某列使用的View
- (UIView *)flowView:(WPPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
//    CusstomPageView *pageView = (CusstomPageView *)[flowView dequeueReusableCell];
    if (index==0)
    {
        OtherCusstomPageView *pageView = [[OtherCusstomPageView alloc] init];
        pageView.backgroundColor = [UIColor whiteColor];
        pageView.tag = index+1000;
        [pageView.contentBtn addTarget:self action:@selector(contentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        pageView.daiKanBtn.alpha = 0;
        return pageView;
    }
    else
    {
        CusstomPageView *pageView = [[CusstomPageView alloc] init];
        pageView.backgroundColor = [UIColor whiteColor];
        pageView.tag = index+1000;
        [pageView.contentBtn addTarget:self action:@selector(contentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [pageView.recommendBtn addTarget:self action:@selector(recommendBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return pageView;
    }
    
    
}
- (void)contentBtnClick:(id)sender
{
    
}
- (void)recommendBtnClick
{
    RecommentViewController *recommentVC = [[RecommentViewController alloc] init];
    recommentVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recommentVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
