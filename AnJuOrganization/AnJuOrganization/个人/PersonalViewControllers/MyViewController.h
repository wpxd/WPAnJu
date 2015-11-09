//
//  MyViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPExpandHeader.h"
@interface MyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    WPExpandHeader *_header;
    NSArray *imgArray;
    NSArray *labArray;
}
@property(nonatomic,strong)UITableView *myTableView;
@end
