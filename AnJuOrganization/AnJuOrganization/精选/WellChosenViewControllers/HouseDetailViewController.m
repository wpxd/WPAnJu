//
//  HouseDetailViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//
//ScrollView的高度
#define kScrollHeight (9*kMainScreenWidth)/16.0
#import "HouseDetailViewController.h"

@interface HouseDetailViewController ()

@end

@implementation HouseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [Common nagationItemTitleView:@"楼盘详情"];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    [self addTableHeaderView];
}
- (void)addTableHeaderView
{
    NSArray *xiaoGuoTuArray = [NSArray arrayWithObjects:@"0.jpg",@"1.jpeg",@"2.jpg", nil];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kScrollHeight)];
    headerView.backgroundColor = [UIColor purpleColor];
    self.myTableView.tableHeaderView = headerView;
    self.myTableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kScrollHeight)];
    _headerScrollView.contentSize = CGSizeMake((kMainScreenWidth * xiaoGuoTuArray.count), 0);
    _headerScrollView.bounces = NO;
    _headerScrollView.showsHorizontalScrollIndicator = NO;
    _headerScrollView.pagingEnabled = YES;
    _headerScrollView.delegate = self;
    [headerView addSubview:_headerScrollView];
    if (xiaoGuoTuArray.count>0)
    {
        for (int i = 0; i < xiaoGuoTuArray.count; i ++)
        {
            UIImageView *scrollImg = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth*i, 0, kMainScreenWidth, kScrollHeight)];
            scrollImg.image = [UIImage imageNamed:[xiaoGuoTuArray objectAtIndex:i]];
            [_headerScrollView addSubview:scrollImg];
//            PhotoListObj *photoListObj = [_xiaoGuoTuArray objectAtIndex:i];
//            HouseDetailScrollImg *scrollImg = [[HouseDetailScrollImg alloc] initViewUrlStr:photoListObj.img_prefix withUrlStr:photoListObj.photo_img];
//            scrollImg.delegate = self;
//            scrollImg.frame = CGRectMake(kMainScreenWidth * i, 0, kMainScreenWidth, kMainScreenWidth*3/4.0);
//            [_scrollView addSubview:scrollImg];
        }
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *CellIntentifier = @"CellIntentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIntentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
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
