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
     
    [self makeUpCells];
    [self makeGoBtn];

    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    
}
- (void)makeGoBtn{
    
    self.goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.goBtn setTitle:@"继续跟进" forState:UIControlStateNormal];
    [self.goBtn setBackgroundColor:[UIColor colorWithHex:0xF93108]];
    [self.view addSubview:self.goBtn];
    [self.goBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    self.goBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    NSString *VformatStr = [NSString stringWithFormat:@"V:|-%f-[btn(==40)]",self.view.bounds.size.height - 40];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:VformatStr options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)]];
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:30]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[btn]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)]];
}
- (void)makeUpCells{
    NSArray *sectionOneCells =
  @[
    [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeAvatar],
    [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypePhoenNum]
    ];
    NSArray *sectionTwoCells =
    @[
      [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeFollowUpRecord],
      [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerRemarks]
      ];

    NSArray *sectionThreeCells =
    @[
      [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerDynamic],
      [AJCustomerDetailBaseTableViewCell viewFromNib:AJCustomerDetailCellsTypeCustomerValidRecommend]
      ];

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.goBtn.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
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
