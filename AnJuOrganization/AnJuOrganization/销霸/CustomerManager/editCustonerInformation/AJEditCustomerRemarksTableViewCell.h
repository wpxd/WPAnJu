//
//  AJEditCustomerDescriptionTableViewCell.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJEditCustomerBaseTableViewCell.h"
@interface AJEditCustomerRemarksTableViewCell : AJEditCustomerBaseTableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *placeHoderLabel;

@end
