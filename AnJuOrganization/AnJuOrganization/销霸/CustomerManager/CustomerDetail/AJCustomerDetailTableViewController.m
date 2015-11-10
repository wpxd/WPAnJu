//
//  CustomerDetailTableViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJCustomerDetailTableViewController.h"
#import "AJCustomerDetailBaseTableViewCell.h"
@interface AJCustomerDetailTableViewController ()
@property (nonatomic ,strong)NSArray *datasources;
@property (nonatomic ,strong)UIButton *goBtn;
@end

@implementation AJCustomerDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"客户详情";
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self makeUpCells];
    [self makeGoBtn];
    [self makeEditItem];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.goBtn.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- custom menthod
- (void)makeGoBtn{
    
    self.goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.goBtn setTitle:@"继续跟进" forState:UIControlStateNormal];
    [self.goBtn setBackgroundColor:[UIColor colorWithHex:0xF93108]];
    [self.view addSubview:self.goBtn];
    [self.goBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)makeUpCells{
    
    AJCustomerDetailBaseTableViewCell *cell1 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeAvatar];
    AJCustomerDetailBaseTableViewCell *cell2 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypePhoenNum];
    
    AJCustomerDetailBaseTableViewCell *cell3 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeFollowUpRecord];
    AJCustomerDetailBaseTableViewCell *cell4 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerRemarks];
    
    AJCustomerDetailBaseTableViewCell *cell5 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerDynamic];
    AJCustomerDetailBaseTableViewCell *cell6 =  [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerValidRecommend];
    
    NSArray *sectionOneCells   =   @[cell1 ,cell2];
    NSArray *sectionTwoCells   =   @[cell3 ,cell4];
    NSArray *sectionThreeCells =   @[cell5 ,cell6];
    
    self.datasources = @[sectionOneCells,sectionTwoCells,sectionThreeCells];
    for (NSArray *subCells in self.datasources) {
        for (AJCustomerDetailBaseTableViewCell *cell in subCells) {
            //这里是赋值操作
            [cell setData:nil];
        }
    }
}
- (void)btnClicked:(UIButton *)btn{
    
}

- (void)makeEditItem{
    UIBarButtonItem *editItem  = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editItemClicked:)];
    [editItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xF93108],}forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = editItem;
    
}
- (void)editItemClicked:(UIBarButtonItem *)iten{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.datasources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *subCells = self.datasources[section];
    return [subCells count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.datasources[indexPath.section][indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AJCustomerDetailBaseTableViewCell *baseCell = self.datasources[indexPath.section][indexPath.row];
    return [AJCustomerDetailBaseTableViewCell cellHeight:baseCell.cellType];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
