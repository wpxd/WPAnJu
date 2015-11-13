//
//  RecommentViewController.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/12.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "RecommentViewController.h"
#import "PPiFlatSegmentedControl.h"
#import "NSString+FontAwesome.h"
#import "AJCustomerListTableViewController.h"
#import "RecommendHouseViewController.h"
#import "RecommendCell.h"
@interface RecommentViewController ()<RecommendHouseViewControllerDelegate>
{
    PPiFlatSegmentedControl *segment;
    UIButton *jianBtn;
    UIImageView *jianImg;
}
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
    segment = [[PPiFlatSegmentedControl alloc] initWithFrame:CGRectMake(kMainScreenWidth-75, 10, 65, 25) items:@[@{@"text":@"先生"},@{@"text":@"女士"}] iconPosition:IconPositionRight andSelectionBlock:^(NSUInteger segmentIndex) {
        NSLog(@"&&&&&&&&&&&%ld",segmentIndex);
    }];
    segment.color = [UIColor whiteColor];
    segment.borderWidth = 0.5;
    segment.borderColor = UIColorFromHex(0xff4800);
    segment.selectedColor = UIColorFromHex(0xff4800);
    segment.textAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:UIColorFromHex(0xff4800)};
    segment.selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor whiteColor]};
    _telTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 52, 150, 30)];
    _telTextField.returnKeyType = UIReturnKeyDone;
    _telTextField.delegate = self;
    _telTextField.textColor = UIColorFromHex(0x333333);
    _telTextField.placeholder = @"请输入客户电话";
    _telTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_telTextField addTarget:self action:@selector(returnKeyClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 97, 150, 30)];
    _phoneTextField.returnKeyType = UIReturnKeyDone;
    _phoneTextField.textColor = UIColorFromHex(0x333333);
    _phoneTextField.placeholder = @"请输入客户电话";
    _phoneTextField.alpha = 0;
    _phoneTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_phoneTextField addTarget:self action:@selector(returnKeyClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    jianImg = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-33, 21+90, 15, 2)];
    jianImg.backgroundColor = UIColorFromHex(0xff4800);
    jianImg.alpha = 0;
    jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jianBtn.frame = CGRectMake(kMainScreenWidth-40, 7+90, 30, 30);
    [jianBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [jianBtn addTarget:self action:@selector(jianBtnClick) forControlEvents:UIControlEventTouchUpInside];
    jianBtn.alpha = 0;
    _beiZhuText = [[XHMessageTextView alloc] initWithFrame:CGRectMake(10, 10, kMainScreenWidth-20, 80)];
//    _beiZhuText.backgroundColor = [UIColor redColor];
    _beiZhuText.textColor = UIColorFromHex(0x333333);
    _beiZhuText.placeHolder = @"请添加备注";
    _beiZhuText.delegate = self;
    _beiZhuText.returnKeyType = UIReturnKeyDone;
    
}
- (void)jianBtnClick
{
    self.isBegainEdit = NO;
    [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [_phoneTextField resignFirstResponder];
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
    if (section==3)
    {
       return 1+self.indexPathArray.count;
    }
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
        if (self.isBegainEdit)
        {
            [UIView animateWithDuration:0.3 animations:^{
                _phoneTextField.alpha = 1;
                jianImg.alpha = 1;
                jianBtn.alpha = 1;
            }];
            return 135;
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                _phoneTextField.alpha = 0;
                jianImg.alpha = 0;
                jianBtn.alpha = 0;
            }];
            return 90;
        }
        
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
            return 55;
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
            UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(80, 90, kMainScreenWidth-80, 0.6)];
            line1.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
            [cell.contentView addSubview:line1];
            [cell.contentView addSubview:self.faceBtn];
            [cell.contentView addSubview:self.nameTextField];
            [cell.contentView addSubview:segment];
            [cell.contentView addSubview:self.telTextField];
            [cell.contentView addSubview:self.phoneTextField];
            [cell.contentView addSubview:jianBtn];
            [cell.contentView addSubview:jianImg];
        }
            break;
        case 2:
        {
            [cell.contentView addSubview:self.beiZhuText];
        }
            break;
        case 3:
        {
            if (indexPath.row == 0)
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
            else
            {
                RecommendCell *cell = [[RecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
                cell.deleteBtn.tag = indexPath.row;
                [cell.deleteBtn addTarget:self action:@selector(deleteHouseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                NSIndexPath *path = [self.indexPathArray objectAtIndex:indexPath.row-1];
                cell.houseName.text = [NSString stringWithFormat:@"%ld",path.row];
                return cell;
            }
            
        }
            break;
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    switch (indexPath.section) {
        case 0:
        {
            AJCustomerListTableViewController *customerManagetVC = [[AJCustomerListTableViewController alloc] init];
            customerManagetVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:customerManagetVC animated:YES];
        }
            break;
        case 3:
        {
            if (indexPath.row==0)
            {
                if (self.indexPathArray.count==5)
                {
                    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"你此次只能推荐5个楼盘" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                    [alerView show];
                    return;
                }
                RecommendHouseViewController *recommendHouseVC = [[RecommendHouseViewController alloc] init];
                recommendHouseVC.delegate = self;
                if (self.indexPathArray.count>0)
                {
                    recommendHouseVC.selectedArray = self.indexPathArray;
                }
                [self.navigationController pushViewController:recommendHouseVC animated:YES];
            }
            else
            {
                
            }
        }
            break;
        default:
            break;
    }
}
- (void)deleteHouseBtnClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [self.indexPathArray removeObjectAtIndex:btn.tag-1];
    [self.myTableView reloadData];
//    NSIndexPath *path = [NSIndexPath indexPathForRow:btn.tag inSection:3];
//    [self.myTableView beginUpdates];
//    [self.myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
//    [self.myTableView endUpdates];
    
    
}
- (void)selectedHouse:(RecommendHouseViewController *)recommendHouseVC withIndextPathArray:(NSMutableArray *)array withHouseObjArray:(NSMutableArray *)objArray
{
    self.indexPathArray = array;
    self.houseObjArray = objArray;
    [self.myTableView reloadData];
}
- (void)faceBtnClick
{
}
//textview代理方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}
- (void)returnKeyClick
{
    [self.view endEditing:YES];
}
//telTextField代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.isBegainEdit = YES;
    [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
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
