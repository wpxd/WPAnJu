//
//  MyMoneyViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/11.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "MyMoneyViewController.h"
#import "CATextLayer+NumberJump.h"
#import "MyMoneyCell.h"
@interface MyMoneyViewController ()

@end

@implementation MyMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [Common nagationItemTitleView:@"我的佣金"];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 180)];
    headView.backgroundColor = UIColorFromHex(0xff4800);
    _myTableView.tableHeaderView = headView;
    UILabel *allLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, kMainScreenWidth, 20)];
    allLabel.text = @"佣金总额（元）";
    allLabel.backgroundColor = [UIColor clearColor];
    allLabel.textColor = [UIColor whiteColor];
    allLabel.font = [UIFont fontWithName:@"Heiti SC" size:14];
    [headView addSubview:allLabel];
    [self initTextLayer:@"2000"];
}
- (void)initTextLayer:(NSString *)allmoney
{
    //总佣金
    _moneyLab = [[CATextLayer alloc]init];
    _moneyLab.contentsScale = 2;//字体模糊
    _moneyLab.frame = CGRectMake(0, 50 , kMainScreenWidth , (kMainScreenHeight-60)/4);
    [_moneyLab setFont:@"STHeiti SC"];
    _moneyLab.fontSize = 70;
    [_moneyLab setAlignmentMode:kCAAlignmentCenter];//水平居中
    _moneyLab.backgroundColor = [UIColor clearColor].CGColor;
    if ([allmoney isKindOfClass:[NSNull class]]) {
        _moneyLab.string = @"暂无佣金";
        _moneyLab.frame = CGRectMake(0, 55 , kMainScreenWidth , (kMainScreenHeight-60)/4);
        _moneyLab.fontSize = 50;
    }
    else
    {
        if ([allmoney isEqualToString:@"0"])
        {
            _moneyLab.frame = CGRectMake(0, 55 , kMainScreenWidth , (kMainScreenHeight-60)/4);
            _moneyLab.string = @"暂无佣金";
            _moneyLab.fontSize = 50;
        }
        else
        {
            [_moneyLab jumpNumberWithDuration:2 fromNumber:0 toNumber:[allmoney floatValue]];
        }
        
    }
    [headView.layer addSublayer:_moneyLab];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 40)];
    sectionView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kMainScreenWidth, 40)];
    lable.text = @"奖金明细";
    lable.textColor = UIColorFromHex(0x333333);
    lable.font = [UIFont fontWithName:@"Heiti SC" size:14];
    [sectionView addSubview:lable];
    
    return sectionView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *CellIntentifier = @"CellIntentifier";
    MyMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIntentifier];
    if (cell==nil)
    {
        cell = [[MyMoneyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
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
