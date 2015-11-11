//
//  AJCustomerListTableViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJCustomerListTableViewController.h"
#import "AJCustomerInfoTableViewCell.h"
#import "AJCustomerDetailTableViewController.h"
NSString * const inentifier = @"inentifier";

@interface AJCustomerListTableViewController ()
@property (nonatomic ,strong)NSMutableArray *dataSourceArr;
@end

@implementation AJCustomerListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"客户管理";
    [self makeAddItem];
    [self makeDataSource];
}

- (void)makeDataSource{
    self.dataSourceArr = [[NSMutableArray alloc]initWithCapacity:24];
    [self.dataSourceArr addObjectsFromArray:@[@"C",@"D",@"F",@"G",@"M",@"P",@"Q",@"M"]];
}
- (void)makeAddItem{
    UIBarButtonItem *addItem  = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addItemClicked:)];
    [addItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xF93108],}forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = addItem;

}
- (void)addItemClicked:(UIBarButtonItem *)iten{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AJCustomerInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inentifier];
    if (!cell) {
        cell = [[AJCustomerInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:inentifier];
        cell.imageView.image = [UIImage imageNamed:@"customerInfo@2x"];
        cell.textLabel.text = @"房先生";
        cell.detailTextLabel.text = @"13010086100";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.dataSourceArr[section];
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AJCustomerDetailTableViewController *detailViewController = [[AJCustomerDetailTableViewController alloc]init];
    [self.navigationController pushViewController:detailViewController animated:YES];

}

@end
