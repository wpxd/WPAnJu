//
//  AllHousesViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/4.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "AllHousesViewController.h"
#import "AllHousesTableViewCell.h"
#import "HouseDetailViewController.h"
@interface AllHousesViewController ()
{
    UIView *headerBtnBackView;
}
@end

@implementation AllHousesViewController
@synthesize myTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavgationBar];
    [self buildHeaderView];
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kMainScreenWidth, kMainScreenHeight-63-50) style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
}
- (void)buildHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 50)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    headerBtnBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kMainScreenWidth/2.0, 40)];
    headerBtnBackView.backgroundColor = UIColorFromHex(0xff4800);
    [headerView addSubview:headerBtnBackView];
    for (int i =0; i<2; i++)
    {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 9+40*i, kMainScreenWidth, 1)];
        lineView.backgroundColor = UIColorFromHex(0xff4800);
        [headerView addSubview:lineView];
        UIButton *louPanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        louPanBtn.frame = CGRectMake((kMainScreenWidth/2.0)*i, 10, kMainScreenWidth/2.0, 40);
        louPanBtn.tag = i+100;
        louPanBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        if (i==0)
        {
            [louPanBtn setTitle:@"所有楼盘" forState:UIControlStateNormal];
            [louPanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [louPanBtn setTitle:@"即将上线" forState:UIControlStateNormal];
            [louPanBtn setTitleColor:UIColorFromHex(0xff4800) forState:UIControlStateNormal];
        }
        [louPanBtn addTarget:self action:@selector(headerViewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:louPanBtn];
    }
    
}
- (void)initNavgationBar
{
    self.navigationItem.titleView = [Common nagationItemTitleView:@"宁波"];
}
-(void)headerViewBtnClicked:(id)sender
{
    UIButton *headerBtn = (UIButton *)sender;
    switch (headerBtn.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.15 animations:^{
                CGRect frame = headerBtnBackView.frame;
                if (frame.origin.x!=0)
                {
                    frame.origin.x = 0;
                    headerBtnBackView.frame = frame;
                    UIButton *otherBtn = (UIButton*)[self.view viewWithTag:101];
                    [otherBtn setTitleColor:UIColorFromHex(0xff4800) forState:UIControlStateNormal];
                }
                
            } completion:^(BOOL finished) {
                [headerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
            }];
            
        }
            break;
        case 101:
        {
            [UIView animateWithDuration:0.15 animations:^{
                CGRect frame = headerBtnBackView.frame;
                if (frame.origin.x==0)
                {
                    frame.origin.x = kMainScreenWidth/2.0;
                    headerBtnBackView.frame = frame;
                    UIButton *otherBtn = (UIButton*)[self.view viewWithTag:100];
                    [otherBtn setTitleColor:UIColorFromHex(0xff4800) forState:UIControlStateNormal];
                }
                
            } completion:^(BOOL finished) {
                [headerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
            }];
        }
            break;
        default:
            break;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIntentifier = @"CellIntentifier";
    AllHousesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIntentifier];
    if (cell==nil)
    {
        cell = [[AllHousesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row%2==0)
    {
        cell.louPanImgView.image = [UIImage imageNamed:@"2.jpg"];
    }
    else
    {
        cell.louPanImgView.image = [UIImage imageNamed:@"3.jpg"];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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
