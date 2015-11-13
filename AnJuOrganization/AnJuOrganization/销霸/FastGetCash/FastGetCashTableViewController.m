//
//  FastGetCashTableViewController.m
//  AnJuOrganization
//
//  Created by xuqianlong on 15/11/13.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "FastGetCashTableViewController.h"

@interface FastGetCashTableViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation FastGetCashTableViewController


- (void)prepareFootView
{
    UIView *footView = [UIView new];
    footView.frame = CGRectMake(0, 0, 0, 130);

    footView.backgroundColor = [UIColor clearColor];
    
    UIButton *tixian = [UIButton buttonWithType:UIButtonTypeCustom];
    [tixian setTitle:@"提交" forState:UIControlStateNormal];
    [tixian setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tixian setBackgroundColor:[UIColor orangeColor]];
    [footView addSubview:tixian];
    tixian.frame = CGRectMake(15, 20, self.view.bounds.size.width - 30, 50);
    tixian.layer.cornerRadius = 5;
    tixian.layer.masksToBounds = YES;
    
    [tixian addTarget:self action:@selector(tixianAction) forControlEvents:UIControlEventTouchUpInside];

    UILabel *tip = [UILabel new];
    tip.text = @"温馨提示：提现银行只支持银行储蓄卡，提现金额将于1至5个工作日到账，节假日顺延";
    tip.textAlignment = NSTextAlignmentCenter;
    tip.numberOfLines = 2;
    tip.font = [UIFont systemFontOfSize:13];
    tip.textColor = UIColorFromHex(0xa2a2a2);
    tip.frame = CGRectMake(35, CGRectGetMaxY(tixian.frame) + 14, CGRectGetWidth(self.view.bounds) - 70, 40);
    [footView addSubview:tip];
    self.tableView.tableFooterView = footView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现";
    
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [self prepareFootView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@"金额",@"银行",@"支行",@"姓名",@"卡号"];
    }
    return _dataSource;
}

- (NSArray *)placeholders
{
    return @[@"本次最多可提现",@"请选择银行",@"请输入开户支行",@"请输入开户人真实姓名",@"请输入卡号"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    UITextField *tx = (UITextField *)[cell viewWithTag:10000];
    if (!tx) {
        tx = [[UITextField alloc]initWithFrame:CGRectMake(64, 0, CGRectGetWidth(tableView.bounds) - 80, 44)];
        tx.delegate = self;
        [cell.contentView addSubview:tx];
        tx.tag = 10000;
    }
    NSString *plac = self.placeholders[indexPath.row];
    if (0 == indexPath.row) {
        plac = [plac stringByAppendingFormat:@"%@元",@"231.00"];
    }
    tx.placeholder = plac;
    // Configure the cell...
    
    return cell;
}
    
#pragma mark - actions

- (void)tixianAction
{

}

#pragma mark -UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
