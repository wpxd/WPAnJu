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
@property (strong, nonatomic)  UIButton *commitBtn;
@property (strong, nonatomic)  UITableView *tableView;

@property (nonatomic ,strong)NSArray *datasources;
@property (nonatomic ,assign)CGPoint originOffset;

@end

@implementation AJEditCustomerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑客户";
    [self makeTabLeView];
    [self makeCommitBtn];
    [self makeCells];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -custom view

- (void)makeTabLeView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.tableView.autoAdaptiveKeyBoard = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];

}
- (void)makeCommitBtn{
    self.commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.commitBtn.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 64 - 44,  [UIScreen mainScreen].bounds.size.width, 44);
    [self.view addSubview:self.commitBtn];
    [self.commitBtn addTarget:self action:@selector(commitAction:) forControlEvents:UIControlEventTouchUpInside];
    self.commitBtn.backgroundColor = [UIColor colorWithHex:0xF93108];
}

- (void)keBoardGesture{
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    
    //给self.view添加一个手势监测；
    
    [self.view addGestureRecognizer:singleRecognizer];
}
- (void)singleTap:(UITapGestureRecognizer *)gesture{
    [self.tableView  subViewresigenFirstResponder];
}
- (void)makeCells{
    AJEditCustomerBaseTableViewCell *avatarCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeAvatar];
    AJEditCustomerBaseTableViewCell *phoneCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypePhoenNum];
    AJEditCustomerBaseTableViewCell *levelCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeLeveal];
    AJEditCustomerBaseTableViewCell *remarksCell = [AJEditCustomerBaseTableViewCell viewFromNib:AJCustomerEditCellsTypeCustomerRemarks];

    
    self.datasources = @[@[avatarCell],@[phoneCell,levelCell],@[remarksCell]];
    
}


- (void)commitAction:(UIButton *)sender {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView subViewresigenFirstResponder];
}


@end
