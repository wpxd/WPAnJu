//
//  RecommentViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/12.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "RecommentViewController.h"

@interface RecommentViewController ()

@end

@implementation RecommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [Common nagationItemTitleView:@"推荐客户"];
    [self buildCellSubViews];
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64-54) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
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
- (void)buildCellSubViews
{
    _faceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _faceBtn.frame = CGRectMake(10, 15, 60, 60);
    [_faceBtn setBackgroundImage:[UIImage imageNamed:@"addClient"] forState:UIControlStateNormal];
    [_faceBtn addTarget:self action:@selector(faceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 7, 150, 30)];
    _nameTextField.returnKeyType = UIReturnKeyDone;
    _nameTextField.textColor = UIColorFromHex(0x333333);
    _nameTextField.placeholder = @"请输入客户姓名";
    _nameTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_nameTextField addTarget:self action:@selector(returnKeyClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    _telTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 52, 150, 30)];
    _telTextField.returnKeyType = UIReturnKeyDone;
    _telTextField.textColor = UIColorFromHex(0x333333);
    _telTextField.placeholder = @"请输入客户电话";
    _telTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_telTextField addTarget:self action:@selector(returnKeyClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    _beiZhuText = [[XHMessageTextView alloc] initWithFrame:CGRectMake(10, 10, kMainScreenWidth-20, 80)];
    _beiZhuText.backgroundColor = [UIColor redColor];
    _beiZhuText.textColor = UIColorFromHex(0x333333);
//    _beiZhuText.placeHolder = @"请添加备注";
    _beiZhuText.delegate = self;
    _beiZhuText.returnKeyType = UIReturnKeyDone;
    
}
- (void)returnKeyClick
{
    [self.view endEditing:YES];
}
- (void)okBtnClick
{
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 40;
    }
    else if (indexPath.section==1)
    {
        return 90;
    }
    else if (indexPath.section==2)
    {
        return 100;
    }
    else
    {
        if (indexPath.row==0)
        {
            return 40;
        }
        else
        {
            return 60;
        }
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.section)
    {
        case 0:
        {
            UIImageView *clientImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12.5, 20, 15)];
            clientImg.image = [UIImage imageNamed:@"clientList"];
            [cell.contentView addSubview:clientImg];
            UILabel *clientLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 150, 20)];
            clientLab.font = [UIFont systemFontOfSize:14];
            clientLab.textColor = UIColorFromHex(0x333333);
            clientLab.text = @"从客户列表选择";
            [cell.contentView addSubview:clientLab];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 1:
        {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(80, 45, kMainScreenWidth-80, 0.6)];
            line.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
            [cell.contentView addSubview:line];
            [cell.contentView addSubview:self.faceBtn];
            [cell.contentView addSubview:self.nameTextField];
            [cell.contentView addSubview:self.telTextField];
        }
            break;
        case 2:
        {
            [cell.contentView addSubview:self.beiZhuText];
        }
            break;
        case 3:
        {
            UIImageView *clientImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10.5, 18, 18)];
            clientImg.image = [UIImage imageNamed:@"addHouses"];
            [cell.contentView addSubview:clientImg];
            UILabel *clientLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 150, 20)];
            clientLab.font = [UIFont systemFontOfSize:14];
            clientLab.textColor = UIColorFromHex(0x333333);
            clientLab.text = @"添加楼盘";
            [cell.contentView addSubview:clientLab];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        default:
            break;
    }
    return cell;
}
- (void)faceBtnClick
{
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
