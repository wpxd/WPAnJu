//
//  CustomerDetailTableViewCell.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJCustomerDetailTableViewCell.h"

@implementation AJCustomerDetailTableViewCell
- (void)setData:(NSObject *)obj{
    
}
- (void)awakeFromNib {
    // Initialization code
   
}


- (void)setCellType:(AJCustomerDetailCellsType)cellType{
    _cellType = cellType;
    switch (self.cellType) {
        case AJCustomerDetailCellsTypePhoenNum:
        {
            self.topLine.hidden = YES;
            self.detailNameLanel.text = @"电话号码";
            self.detailImageView.image = [UIImage imageNamed:@"phone"];
            self.detailLabel.text = nil;
            break;
        }
        case AJCustomerDetailCellsTypeFollowUpRecord:
        {
            self.detailNameLanel.text = @"跟进记录";
            self.detailImageView.hidden = YES;
            self.detailLabel.text = nil;
            self.bottomLine.hidden = YES;
            break;
        }
        case AJCustomerDetailCellsTypeCustomerRemarks:
        {
            self.detailNameLanel.text = @"客户备注";
            self.detailImageView.hidden = YES;
            self.detailLabel.text = nil;
            break;
        }
        case AJCustomerDetailCellsTypeCustomerDynamic:
        {
            self.detailNameLanel.text = @"客户动态";
            self.detailImageView.hidden = YES;
            self.detailLabel.text = nil;
            self.bottomLine.hidden = YES;
            break;
        }
        default:
        {
            self.detailNameLanel.text = nil;
            self.detailLabel.text = nil;
            self.detailImageView.hidden = YES;
            break;
        }
            
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
