//
//  AJRecommendHistoryDetailViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJRecommendHistoryDetailViewController.h"
#import "AJRecommendHistoryTableViewCell.h"
@interface AJRecommendHistoryDetailViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic ,strong)NSMutableArray *datasources;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation AJRecommendHistoryDetailViewController
static NSString *const cellIdentifier = @"cellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[AJRecommendHistoryTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    AJRecommendHistoryTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[AJRecommendHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];;
//    }
//    return cell;
   
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
    
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
