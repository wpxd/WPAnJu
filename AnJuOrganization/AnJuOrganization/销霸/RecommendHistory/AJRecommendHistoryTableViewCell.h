//
//  AJRecommendHistoryTableViewCell.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJRecommendHistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *namePhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
