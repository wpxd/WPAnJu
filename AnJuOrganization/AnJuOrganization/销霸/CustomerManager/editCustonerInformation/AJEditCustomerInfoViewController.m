//
//  AJEditCustomerInfoViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomerInfoViewController.h"
#import "AJEditCustomerBaseTableViewCell.h"
#import "UIScrollView+AdaptiveKeyboardHeight.h"
@interface AJEditCustomerInfoViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong)NSArray *datasources;
@end

@implementation AJEditCustomerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑客户";
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.autoAdaptiveKeyBoard = YES;
    [self makeCommitBtn];
    [self makeCells];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -custom view

- (void)makeCells{
    AJEditCustomerBaseTableViewCell *avatarCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeAvatar];
    AJEditCustomerBaseTableViewCell *phoneCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypePhoenNum];
    AJEditCustomerBaseTableViewCell *levelCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeLeveal];
    AJEditCustomerBaseTableViewCell *remarksCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeCustomerRemarks];
    
    self.datasources = @[@[avatarCell],@[phoneCell,levelCell],@[remarksCell]];
    
}

- (void)makeCommitBtn{
    self.commitBtn.backgroundColor = [UIColor colorWithHex:0xF93108];
}

- (IBAction)commitAction:(UIButton *)sender {
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
    
    AJEditCustomerBaseTableViewCell *baseCell = self.datasources[indexPath.section][indexPath.row];
    return [baseCell cellHeight:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}




@end
