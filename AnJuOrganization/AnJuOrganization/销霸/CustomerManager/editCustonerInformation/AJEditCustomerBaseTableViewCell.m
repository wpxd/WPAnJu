//
//  AJEditCustomerBaseTableViewCell.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomerBaseTableViewCell.h"

@implementation AJEditCustomerBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype )viewFromNib:(AJCustomerEditCellsType )type{
    
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:[[self class] getNameBy:type] owner:nil options:nil];
    for (id object in array) {
        if ([object isKindOfClass:[self class]]){
            ((AJEditCustomerBaseTableViewCell *)object).cellType = type;
            return object;
        }
        
    }
    return nil;
   
}
- (CGFloat)cellHeight:(NSObject *)type{
    AJCustomerEditCellsType atype = self.cellType;
    switch (atype) {
        case AJCustomerEditCellsTypeAvatar :
            return 60;
            break;
        
        case AJCustomerEditCellsTypeLeveal :
            return 100;
            break;
        case AJCustomerEditCellsTypeCustomerRemarks :
            return 100;
            break;
            
        default:
            return 44;
            break;
    }

    return 40;
}
- (void)setData:(NSObject *)obj{
    
}

+ (NSString *)getNameBy:(AJCustomerEditCellsType )type{
    switch (type) {
        case AJCustomerEditCellsTypeAvatar :
            return @"AJEditCustomerAvatarTableViewCell";
            break;
        case AJCustomerEditCellsTypePhoenNum :
            return @"AJEditCustomerPhoneTableViewCell";
            break;
        case AJCustomerEditCellsTypeLeveal :
            return @"AJEditCustomerLevelTableViewCell";
            break;
        case AJCustomerEditCellsTypeCustomerRemarks :
            return @"AJEditCustomerRemarksTableViewCell";
            break;
                    
        default:
            return nil;
            break;
    }
}

@end
