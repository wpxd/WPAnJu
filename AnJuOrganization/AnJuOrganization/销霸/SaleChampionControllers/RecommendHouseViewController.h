//
//  RecommendHouseViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/13.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecommendHouseViewController;
@protocol RecommendHouseViewControllerDelegate <NSObject>
- (void)selectedHouse:(RecommendHouseViewController *)recommendHouseVC withIndextPathArray:(NSMutableArray *)array withHouseObjArray:(NSMutableArray *)objArray;
@end
@interface RecommendHouseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)id<RecommendHouseViewControllerDelegate> delegate;
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSMutableArray *selectedArray;
@end
