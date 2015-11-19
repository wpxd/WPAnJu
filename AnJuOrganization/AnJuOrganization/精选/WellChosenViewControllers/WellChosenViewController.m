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
#import "NewHouseObj.h"
@interface WellChosenViewController ()
@property (nonatomic,strong)AFHttpRequestManager *requestManager;
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
    _requestManager = [[AFHttpRequestManager alloc] init];
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-63-50) style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    myTableView.tableFooterView = footerView;
    self.houseObjArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self requestClientListData];
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
//获取枪客列表
- (void)requestClientListData
{
    WEAKSELF
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progressHUD.labelText = @"正在加载";
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:kAppToken];
    NSMutableDictionary *postDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"house",@"app",@"recommend",@"act",@"1",@"pageno",@"15",@"atpp", nil];
    [self.requestManager httpPostManager:Common_URLSTR withRequestDic:postDic success:^(NSDictionary *requestDic) {
        [progressHUD hide:YES];
        if ([[requestDic objectForKey:@"status"] isEqualToString:@"1"])
        {   
//            NSLog(@"&&&&&&&&&%@",requestDic);
            [weakSelf clientListDataSuccessJson:requestDic];
        }
        else
        {
            [Common showAlertView:[requestDic objectForKey:@"detail"]];
        }
        
    } failed:^(NSString *errorStr) {
        [progressHUD hide:YES];
        [Common showAlertView:errorStr];
    }];
    
}
- (void)clientListDataSuccessJson:(NSDictionary *)successDic
{
    NSDictionary *dataDic = [successDic objectForKey:@"data"];
//    self.dataListCount = [[dataDic objectForKey:@"item_count"] intValue];
    if ([[dataDic objectForKey:@"house_list"] isKindOfClass:[NSArray class]])
    {
        NSArray *houseArray = [dataDic objectForKey:@"house_list"];
        for (NSDictionary *robClientDic in houseArray)
        {
            NewHouseObj *houseObj = [[NewHouseObj alloc] initWithDictionary:robClientDic];
            [self.houseObjArray addObject:houseObj];
        }
        
//        if (self.robClientListArray.count >= self.dataListCount)
//        {
//            _tableView.showsInfiniteScrolling = NO;
//            _tableView.frame = CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64-49);
//        }
    }
    [self.myTableView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.houseObjArray.count;
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
    if (self.houseObjArray.count>0)
    {
        NewHouseObj *houseObj = [self.houseObjArray objectAtIndex:indexPath.row];
        cell.louPanName.text = houseObj.house_name;
        if ([houseObj.house_logo isKindOfClass:[NSNull class]])
        {
            cell.louPanImgView.image = [UIImage imageNamed:@"house_img@2x.png"];
        }
        else
        {
            if (![houseObj.house_logo isEqualToString:@""])
            {
                NSString *imgStr = [NSString stringWithFormat:@"%@!120x90",houseObj.house_logo];
                [cell.louPanImgView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"house_img@2x.png"]];
            }
            else
            {
                cell.louPanImgView.image = [UIImage imageNamed:@"house_img@2x.png"];
            }
        }
        if ([houseObj.price isKindOfClass:[NSNull class]])
        {
            cell.louPanPrice.text = @"均价：价格待定";
        }
        else
        {
            cell.louPanPrice.text = [NSString stringWithFormat:@"均价：%@元/㎡",houseObj.price];
        }
        NSDictionary* attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        
        if ([houseObj.yongjing isKindOfClass:[NSNull class]])
        {
            cell.yongJinLab.text = @"佣金：待定";
        }
        else
        {
            if ([houseObj.yongjing isEqualToString:@"0"])
            {
                cell.yongJinLab.text = @"佣金：待定";
            }
            else
            {
                cell.yongJinLab.text = [NSString stringWithFormat:@"佣金：¥%@",houseObj.yongjing];
//                cell.yongJinLab.text = @"佣金：待定";
                CGSize size = [cell.yongJinLab.text  sizeWithAttributes:attributes];
                cell.yongJinView.frame = CGRectMake(kMainScreenWidth-size.width-20, 120, size.width+10, 30);
                cell.yongJinLab.frame = CGRectMake(5, 5, size.width, 20);
            }
        }
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
