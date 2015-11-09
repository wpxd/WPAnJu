//
//  SaleChampionViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPPagedFlowView.h"
@interface SaleChampionViewController : UIViewController<PagedFlowViewDataSource,PagedFlowViewDelegate>
{
}
@property(nonatomic,strong)WPPagedFlowView *hFlowView;


@end
