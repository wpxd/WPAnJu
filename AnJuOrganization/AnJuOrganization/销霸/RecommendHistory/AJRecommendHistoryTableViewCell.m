//
//  AJRecommendHistoryTableViewCell.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJRecommendHistoryTableViewCell.h"

@implementation AJRecommendHistoryTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"AJRecommendHistoryTableViewCell" owner:nil options:nil];
        for (id object in array) {
            if ([object isKindOfClass:[self class]])return object;
        }
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
