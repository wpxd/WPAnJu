//
//  AJCustomerBaseTableViewCell.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJCustomerDetailBaseTableViewCell.h"

@implementation AJCustomerDetailBaseTableViewCell


+ (instancetype )viewFromNib:(AJCustomerDetailCellsType )type{
   
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:[[self class] getNameBy:type] owner:nil options:nil];
    for (id object in array) {
        if ([object isKindOfClass:[self class]]){
            ((AJCustomerDetailBaseTableViewCell *)object).cellType = type;
            return object;
        }
        
    }
    return nil;
}
+ (NSString *)getNameBy:(AJCustomerDetailCellsType )type{
    switch (type) {
        case AJCustomerDetailCellsTypeAvatar :
            return @"AJCustomerDetailAvatarTableViewCell";
            break;
        case AJCustomerDetailCellsTypePhoenNum :
            return @"AJCustomerDetailTableViewCell";
            break;
        case AJCustomerDetailCellsTypeFollowUpRecord :
            return @"AJCustomerDetailTableViewCell";
            break;
        case AJCustomerDetailCellsTypeCustomerRemarks :
            return @"AJCustomerDetailTableViewCell";
            break;
        case AJCustomerDetailCellsTypeCustomerDynamic :
            return @"AJCustomerDetailTableViewCell";
            break;
        case AJCustomerDetailCellsTypeCustomerValidRecommend :
            return @"AJCustomerDeatailProgressTableViewCell";
            break;
            
        default:
            return nil;
            break;
    }
}
+ (CGFloat)cellHeight:(AJCustomerDetailCellsType)type{
    switch (type) {
        case AJCustomerDetailCellsTypeAvatar :
            return 65;
            break;
        case AJCustomerDetailCellsTypePhoenNum :
            return 38;
            break;
        case AJCustomerDetailCellsTypeFollowUpRecord :
            return 44;
            break;
        case AJCustomerDetailCellsTypeCustomerRemarks :
            return 44;
            break;
        case AJCustomerDetailCellsTypeCustomerDynamic :
            return 44;
            break;
        case AJCustomerDetailCellsTypeCustomerValidRecommend :
            return 74;
            break;
        default:
            return 44;
            break;
    }
}

- (void)setData:(NSObject *)obj{
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
