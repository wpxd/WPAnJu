//
//  AJCustomerBaseTableViewCell.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,AJCustomerDetailCellsType) {
    AJCustomerDetailCellsTypeAvatar,//头像
    AJCustomerDetailCellsTypePhoenNum,//电话
    
    AJCustomerDetailCellsTypeFollowUpRecord,//跟进记录
    AJCustomerDetailCellsTypeCustomerRemarks,//客户备注
    
    AJCustomerDetailCellsTypeCustomerDynamic,//客户动态
    AJCustomerDetailCellsTypeCustomerValidRecommend//有效推荐
};
@interface AJCustomerDetailBaseTableViewCell : UITableViewCell
@property (assign ,nonatomic)AJCustomerDetailCellsType cellType;
+ (instancetype )viewFromNib:(AJCustomerDetailCellsType )type;
+ (CGFloat)cellHeight:(AJCustomerDetailCellsType)type;
- (void)setData:(NSObject *)obj;
@end
