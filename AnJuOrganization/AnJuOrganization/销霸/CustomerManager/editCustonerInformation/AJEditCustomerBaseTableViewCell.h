//
//  AJEditCustomerBaseTableViewCell.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,AJCustomerEditCellsType) {
    AJCustomerEditCellsTypeAvatar,//头像
    AJCustomerEditCellsTypePhoenNum,//电话
    
    AJCustomerEditCellsTypeLeveal,//客户等级
    AJCustomerEditCellsTypeCustomerRemarks,//客户备注
    
    
};
@interface AJEditCustomerBaseTableViewCell : UITableViewCell

@end
