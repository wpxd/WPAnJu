//
//  AJRecommendHistoryListViewController.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJRecommendHistoryListViewController.h"
#import "AJRecommendHistoryDetailViewController.h"
@interface AJRecommendHistoryListViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>
@property (strong, nonatomic)  UIScrollView *contentScrollView;
@property (strong, nonatomic)  NSMutableArray *datasources;
@end

@implementation AJRecommendHistoryListViewController
#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeCollcetionView];
    [self makeDataSources:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - custom  method
- (void)makeCollcetionView{

    self.contentScrollView = [[UIScrollView alloc]
                           initWithFrame:CGRectMake(0,
                                                    64,
                                                    [UIScreen mainScreen].bounds.size.width,
                                                    [UIScreen mainScreen].bounds.size.height - 64)];
    self.contentScrollView.delegate = self;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width
                                                    * 6,
                                                    [UIScreen mainScreen].bounds.size.height - 64) ;
    self.contentScrollView.showsHorizontalScrollIndicator = YES;
    self.contentScrollView.showsVerticalScrollIndicator = YES;
    self.contentScrollView.directionalLockEnabled = YES;
    [self.view addSubview:self.contentScrollView];
    
    AJRecommendHistoryDetailViewController *cell0 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell0.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    AJRecommendHistoryDetailViewController *cell1 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell1.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 1, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    AJRecommendHistoryDetailViewController *cell2 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell2.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    AJRecommendHistoryDetailViewController *cell3 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell3.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 3, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    AJRecommendHistoryDetailViewController *cell4 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell4.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 4, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    AJRecommendHistoryDetailViewController *cell5 = [[AJRecommendHistoryDetailViewController alloc]init];
    cell5.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 5, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    
    [self addChildViewController:cell0];
    [self addChildViewController:cell1];
    [self addChildViewController:cell2];
    [self addChildViewController:cell3];
    [self addChildViewController:cell4];
    [self addChildViewController:cell5];

    [self.contentScrollView addSubview:cell0.view];
    [self.contentScrollView addSubview:cell1.view];
    [self.contentScrollView addSubview:cell2.view];
    [self.contentScrollView addSubview:cell3.view];
    [self.contentScrollView addSubview:cell4.view];
    [self.contentScrollView addSubview:cell5.view];
   

 
    
}

- (void)makeDataSources:(NSArray *)arr{
    
    
//    self.datasources = [NSMutableArray arrayWithArray:@[cell0,cell1,cell2,cell3,cell4,cell5]];
}

#pragma mark -collection datasource delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return self.datasources[indexPath.row];
}



@end
