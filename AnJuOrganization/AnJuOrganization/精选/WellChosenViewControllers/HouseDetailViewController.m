//
//  HouseDetailViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//
//ScrollView的高度
#define FONT_SIZE 13.0f
#define CELL_CONTENT_WIDTH kMainScreenWidth
#define CELL_CONTENT_MARGIN 5.0f
#define kScrollHeight (9*kMainScreenWidth)/16.0
#import "HouseDetailViewController.h"
#import "HouseDetailCellOne.h"
#import "HouseDetailCellTwo.h"
#import "HouseDetailCellThree.h"
#import "HouseDetailCellFour.h"
#import "AllHousesTableViewCell.h"
@interface HouseDetailViewController ()

@end

@implementation HouseDetailViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [houseDetailTimer setFireDate:[NSDate distantPast]];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [houseDetailTimer setFireDate:[NSDate distantFuture]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [Common nagationItemTitleView:@"楼盘详情"];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    [self addTableHeaderView];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 45)];
    footerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _myTableView.tableFooterView = footerView;
    //cell分割线顶满
    if ([_myTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_myTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_myTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    //推荐btn
    UIButton *recommentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recommentBtn.frame = CGRectMake(0, kMainScreenHeight-45-64, kMainScreenWidth, 45);
    recommentBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [recommentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [recommentBtn setTitle:@"立即推荐" forState:UIControlStateNormal];
    [recommentBtn setBackgroundColor:UIColorFromHex(0xff4800)];
    recommentBtn.alpha = 0.97;
    [recommentBtn addTarget:self action:@selector(recommentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recommentBtn];
}
- (void)recommentBtnClick
{
    
}
- (void)addTableHeaderView
{
    xiaoGuoTuArray = [NSArray arrayWithObjects:@"0.jpg",@"1.jpeg",@"2.jpg", nil];
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
    _direction = 1;
    _pageControl = [[WPPageControl alloc] initWithFrame:CGRectMake((kMainScreenWidth-70)/2.0, kScrollHeight - 30, 70, 30)];
    _pageControl.numberOfPages = xiaoGuoTuArray.count;
    [headerView addSubview:_pageControl];
    if (xiaoGuoTuArray.count>1)
    {
        houseDetailTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(onTime) userInfo:nil repeats:YES];
    }
    UIView *yongJinView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth-120, kScrollHeight-30, 110, 30)];
    yongJinView.backgroundColor = UIColorFromHex(0x000000);
    yongJinView.alpha = 0.7;
    [headerView addSubview:yongJinView];
    _yongJinLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 20)];
    _yongJinLab.font = [UIFont systemFontOfSize:14];
    _yongJinLab.textColor = [UIColor whiteColor];
    _yongJinLab.textAlignment = NSTextAlignmentCenter;
    _yongJinLab.text = @"佣金：￥20000";
    [yongJinView addSubview:_yongJinLab];
}
//定时器方法
- (void)onTime
{
    _count ++;
    if (xiaoGuoTuArray.count>0)
    {
        if (_count % xiaoGuoTuArray.count != 0) return;
        _count = 0;
        if (_scrollImgViewIndex == 0)
        {
            _direction = 1;
        }
        if (_scrollImgViewIndex == xiaoGuoTuArray.count - 1)
        {
            _direction = - 1;
        }
        _scrollImgViewIndex += _direction;
        
        [UIView animateWithDuration:0.4 animations:^{
            _headerScrollView.contentOffset = CGPointMake(_scrollImgViewIndex * kMainScreenWidth, 0);
        }];
        _pageControl.currentPage = _scrollImgViewIndex;
        [self changePicImageView];
    }
}
- (void)changePicImageView
{
    if (_scrollImgViewIndex == 0)
    {
        _direction = 1;
    }
    if (_scrollImgViewIndex == xiaoGuoTuArray.count - 1)
    {
        _direction = - 1;
    }
    _pageControl.currentPage = _scrollImgViewIndex;
}
//ScrollView的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.headerScrollView)
    {
        _count = 0;
        _dragImgViewIndex = scrollView.contentOffset.x / kMainScreenWidth;
        
        if (_dragImgViewIndex != _scrollImgViewIndex)
        {
            _scrollImgViewIndex = _dragImgViewIndex;
            [self changePicImageView];
        }
    }
}
//设置分割线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==4)
    {
        return 4;
    }
    else
    {
        return 1;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==4)
    {
        return 0.1;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            NSString *text = @"的卡号打打卡是的哈客户的卡号的卡号SD卡撒的卡号说电话卡HD声卡和低价位得噢积分我都去偶的我七号定位好的定期维护地区厚底我地区和地区和地区和地区厚底董卿和大红大全东区活动秦皇岛地区和无误后分红网红的话我去活动群活动我的厚度";
            return 175+[self getCellHeightWithAttributedString:text];
        }
            break;
        case 1:
        {
            NSString *text = @"海曙核心地段";
            return 135+[self getCellHeightWithAttributedString:text];
        }
            break;
        case 2:
        {
            return 220;
        }
            break;
        case 3:
        {
            return 210;
        }
            break;
        case 4:
        {
            if (indexPath.row==0)
            {
                return 50;
            }
            else
            {
                return 96;
            }
            
        }
            break;
        default:
            break;
    }
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        HouseDetailCellOne *cellOne = [[HouseDetailCellOne alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *text = @"的卡号打打卡是的哈客户的卡号的卡号SD卡撒的卡号说电话卡HD声卡和低价位得噢积分我都去偶的我七号定位好的定期维护地区厚底我地区和地区和地区和地区厚底董卿和大红大全东区活动秦皇岛地区和无误后分红网红的话我去活动群活动我的厚度";
        [cellOne.houseDynamicLab setText:text];
        [cellOne.houseDynamicLab setFrame:CGRectMake(CELL_CONTENT_MARGIN, 175, kMainScreenWidth - (CELL_CONTENT_MARGIN * 2), MAX([self getHeightWithAttributedString:text], 35.0f - CELL_CONTENT_MARGIN*2))];
        return cellOne;
    }
    else if (indexPath.section==1)
    {
        HouseDetailCellTwo *cellTwo = [[HouseDetailCellTwo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cellTwo.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *text = @"海曙核心地段";
        [cellTwo.buyPointLab setText:text];
        [cellTwo.buyPointLab setFrame:CGRectMake(CELL_CONTENT_MARGIN, 133, kMainScreenWidth - (CELL_CONTENT_MARGIN * 2), MAX([self getHeightWithAttributedString:text], 35.0f - CELL_CONTENT_MARGIN*2))];
        return cellTwo;
    }
    else if (indexPath.section==2)
    {
        HouseDetailCellThree *cellThree = [[HouseDetailCellThree alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cellThree.selectionStyle = UITableViewCellSelectionStyleNone;
        [cellThree buildHuXingScrollView:[NSArray arrayWithObjects:@"3.jpg",@"3.jpg",@"3.jpg",@"3.jpg",@"3.jpg", nil]];
        return cellThree;
    }
    else if (indexPath.section==3)
    {
        HouseDetailCellFour *cellFour = [[HouseDetailCellFour alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cellFour.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellFour;
    }
    else
    {
        if (indexPath.row==0)
        {
            static  NSString *CellIntentifier = @"CellIntentifier";
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIntentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *nearbyLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 80, 20)];
            nearbyLab.font = [UIFont systemFontOfSize:14];
            nearbyLab.textColor =[UIColor blackColor];
            nearbyLab.text = @"附近楼盘";
            [cell.contentView addSubview:nearbyLab];
            return cell;
        }
        else
        {
            AllHousesTableViewCell *cell = [[AllHousesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    }
    
}
- (CGFloat)getHeightWithAttributedString:(NSString *)text
{
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000);//
    NSDictionary * attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:FONT_SIZE] forKey:NSFontAttributeName];
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:text
     attributes:attributes];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];//
    CGSize size = rect.size;
    return size.height;
}

- (CGFloat)getCellHeightWithAttributedString:(NSString *)aStr
{
    CGFloat height = [self getHeightWithAttributedString:aStr] + 2*CELL_CONTENT_MARGIN;
    return  MAX(height, 30.0f);
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
