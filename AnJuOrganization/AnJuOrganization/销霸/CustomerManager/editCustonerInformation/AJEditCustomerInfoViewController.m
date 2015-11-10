//
//  AJEditCustomerInfoViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomerInfoViewController.h"

@interface AJEditCustomerInfoViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic ,strong)NSArray *datasources;
@end

@implementation AJEditCustomerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑客户";
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
    return 44;
//    AJCustomerDetailBaseTableViewCell *baseCell = self.datasources[indexPath.section][indexPath.row];
//    return [AJCustomerDetailBaseTableViewCell cellHeight:baseCell.cellType];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}




@end
