//
//  AJEditCustomerDescriptionTableViewCell.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomerRemarksTableViewCell.h"
@interface AJEditCustomerRemarksTableViewCell()
<
UITextViewDelegate
>

@end
@implementation AJEditCustomerRemarksTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark- textViewDelegate 
- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.placeHoderLabel.hidden = YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
     self.placeHoderLabel.hidden = NO;
}
@end
