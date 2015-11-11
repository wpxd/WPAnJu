//
//  WellChosenViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "WellChosenViewController.h"
#import "WellChosenTableCell.h"
#import "AllHousesViewController.h"
#import "HouseDetailViewController.h"
@interface WellChosenViewController ()

@end

@implementation WellChosenViewController
@synthesize myTableView;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabbarIndex = 1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self initNavgationBar];
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-63-50) style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
}
- (void)initNavgationBar
{
    self.navigationItem.titleView=[Common nagationItemTitleView:@"精选楼盘"];
    UIView *rightNavItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 56, 44)];
    UILabel *rightNavItemLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 56, 20)];
    rightNavItemLab.font = [UIFont systemFontOfSize:14];
    rightNavItemLab.textColor = UIColorFromHex(0xff4800);
    rightNavItemLab.textAlignment = NSTextAlignmentCenter;
    rightNavItemLab.text = @"所有楼盘";
    [rightNavItemView addSubview:rightNavItemLab];
    UIButton *rightNavItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightNavItemBtn.frame = CGRectMake(0, 5, 56, 34);
    [rightNavItemBtn addTarget:self action:@selector(rightNavItemBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [rightNavItemView addSubview:rightNavItemBtn];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightNavItemView];
    self.navigationItem.rightBarButtonItem = rightItem;
//    [self.navigationController.tabBarItem setBadgeValue:@"3"];
}
- (void)rightNavItemBtnClicked
{
    AllHousesViewController *allHousesVC = [[AllHousesViewController alloc] init];
    allHousesVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:allHousesVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *CellIntentifier = @"CellIntentifier";
    WellChosenTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIntentifier];
    if (cell==nil)
    {
        cell = [[WellChosenTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row%2==0)
    {
        cell.louPanImgView.image = [UIImage imageNamed:@"0.jpg"];
    }
    else
    {
        cell.louPanImgView.image = [UIImage imageNamed:@"1.jpeg"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HouseDetailViewController *houseDetailVC = [[HouseDetailViewController alloc] init];
    houseDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:houseDetailVC animated:YES];
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
