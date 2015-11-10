//
//  AJEditCustomerBaseTableViewCell.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AJEditCustomerBaseTableViewCell;


typedef NS_ENUM(NSInteger ,AJCustomerEditCellsType) {
    AJCustomerEditCellsTypeAvatar,//头像
    AJCustomerEditCellsTypePhoenNum,//电话
    
    AJCustomerEditCellsTypeLeveal,//客户等级
    AJCustomerEditCellsTypeCustomerRemarks,//客户备注
};

typedef NS_OPTIONS(NSUInteger, AJCustomerEditCellsOptions) {
    AJCustomerEditCellsOptionsRemarksEditBegin,
    AJCustomerEditCellsOptionsRemarksEditEnd,
    
};
typedef void (^AJCustomerEidtCellCallBackBlock) (AJEditCustomerBaseTableViewCell *cell,AJCustomerEditCellsOptions options);
@interface AJEditCustomerBaseTableViewCell : UITableViewCell
{
    AJCustomerEditCellsType _cellType;
    AJCustomerEidtCellCallBackBlock _callBackBlock;
}

@property (assign ,nonatomic)AJCustomerEditCellsType cellType;
@property (strong ,nonatomic)AJCustomerEidtCellCallBackBlock callBackBlock;
+ (instancetype )viewFromNib:(AJCustomerEditCellsType )type;
- (CGFloat)cellHeight:(NSObject *)type;
- (void)setData:(NSObject *)obj;
@end
