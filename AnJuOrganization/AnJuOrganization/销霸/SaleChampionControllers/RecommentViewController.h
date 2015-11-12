//
//  RecommentViewController.h
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/12.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHMessageTextView.h"
@interface RecommentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)UIButton *faceBtn;
@property(nonatomic,strong)UITextField *nameTextField;
@property(nonatomic,strong)UITextField *telTextField;
@property(nonatomic,strong)UITextView *beiZhuText;
@end
