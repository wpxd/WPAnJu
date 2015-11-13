//
//  RecommendHouseViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/13.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "RecommendHouseViewController.h"
#import "RecommdHouseCell.h"
@interface RecommendHouseViewController ()

@end

@implementation RecommendHouseViewController
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _selectedArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [Common nagationItemTitleView:@"选择楼盘"];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64-54) style:UITableViewStylePlain];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, kMainScreenHeight-64-54, kMainScreenWidth, 0.7)];
    line.backgroundColor = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1];
    [self.view addSubview:line];
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.frame = CGRectMake(10, kMainScreenHeight-64-47, kMainScreenWidth-20, 40);
    [okBtn.layer setCornerRadius:5];
    okBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [okBtn setBackgroundColor:UIColorFromHex(0xff4800)];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okBtn];
}
- (void)okBtnClick
{
    if (self.delegate&&[self.delegate conformsToProtocol:@protocol(RecommendHouseViewControllerDelegate)])
    {
        [self.delegate selectedHouse:self withIndextPathArray:self.selectedArray withHouseObjArray:self.selectedArray];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIntentifier = @"CellIntentifier";
    RecommdHouseCell *cell = [[RecommdHouseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.selectedArray.count>0)
    {
        for(NSIndexPath *path in self.selectedArray)
        {
            if (path==indexPath)
            {
                cell.gouImgView.image = [UIImage imageNamed:@"quanLight"];
            }
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommdHouseCell *cell = (RecommdHouseCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (self.selectedArray.count>0)
    {
        for (NSIndexPath *path in self.selectedArray)
        {
            if (path == indexPath)
            {
                [_selectedArray removeObject:path];
                cell.gouImgView.image = [UIImage imageNamed:@"quanNomarl"];
                return;
            }
        }
    }
    if (self.selectedArray.count==5)
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"你此次只能推荐5个楼盘" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alerView show];
        return;
    }
    cell.gouImgView.image = [UIImage imageNamed:@"quanLight"];
    [_selectedArray addObject:indexPath];
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
