//
//  MyViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "MyViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "MyMoneyViewController.h"
#import "AJPersonalSettingTableViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (delegate.tabbarIndex!=3)
    {
        self.navigationController.navigationBarHidden = YES;
    }
    else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    delegate.tabbarIndex = 3;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
 
    imgArray = [NSArray arrayWithObjects:@"myUpDate",@"myHelp",@"myAbout", nil];
    labArray = [NSArray arrayWithObjects:@"检查更新",@"帮助与反馈",@"关于安居中国专业版", nil];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-50) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    [self buildTableHeaderView];
}
- (void)buildTableHeaderView
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 200)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 200)];
    imageView.backgroundColor = UIColorFromHex(0xff4800);
    //关键步骤 设置可变化背景view属性
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [customView addSubview:imageView];
    UIImageView *setingImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 30, 30)];
    setingImg.image = [UIImage imageNamed:@"mySeting"];
    [customView addSubview:setingImg];
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(5, 20, 50, 50);
    [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:settingBtn];
    _touXiangImg = [[UIImageView alloc] initWithFrame:CGRectMake((kMainScreenWidth-60)/2.0, -144, 60, 60)];
    _touXiangImg.image = [UIImage imageNamed:@"touXiang"];
    [_myTableView addSubview:_touXiangImg];
    _nameLab = [[UILabel alloc] initWithFrame:CGRectMake((kMainScreenWidth-80)/2.0, -75, 80, 20)];
    _nameLab.font = [UIFont systemFontOfSize:18];
    _nameLab.textAlignment = NSTextAlignmentCenter;
    _nameLab.textColor = [UIColor whiteColor];
    _nameLab.text = @"任我行";
    [self.myTableView addSubview:_nameLab];
    _informationLab = [[UILabel alloc] initWithFrame:CGRectMake(50, -45, kMainScreenWidth-100, 20)];
    _informationLab.font = [UIFont systemFontOfSize:15];
    _informationLab.textAlignment = NSTextAlignmentCenter;
    _informationLab.textColor = [UIColor whiteColor];
    _informationLab.text = @"宁波市安居乐信息技术有限公司";
    [self.myTableView addSubview:_informationLab];
    _header = [WPExpandHeader expandWithScrollView:self.myTableView expandView:customView];
}
- (void)settingBtnClick
{
    AJPersonalSettingTableViewController *vc = [[AJPersonalSettingTableViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        case 2:
        {
            return 3;
        }
            break;
        default:
            break;
    }
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.section)
    {
        case 0:
        {
            cell.imageView.image = [UIImage imageNamed:@"myYong"];
            cell.textLabel.textColor = UIColorFromHex(0x333333);
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            [cell.textLabel setText:@"我的佣金"];
        }
            break;
        case 1:
        {
            cell.imageView.image = [UIImage imageNamed:@"myMiMa"];
            cell.textLabel.textColor = UIColorFromHex(0x333333);
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            [cell.textLabel setText:@"修改密码"];
        }
            break;
        case 2:
        {
            cell.imageView.image = [UIImage imageNamed:[imgArray objectAtIndex:indexPath.row]];
            cell.textLabel.textColor = UIColorFromHex(0x333333);
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            [cell.textLabel setText:[labArray objectAtIndex:indexPath.row]];
        }
            break;
        default:
            break;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        MyMoneyViewController *myMoneyVC = [[MyMoneyViewController alloc] init];
        myMoneyVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myMoneyVC animated:YES];
    }
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
