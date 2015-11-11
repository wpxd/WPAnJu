//
//  AJEditCustomAddPhoneNumView.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AJEditCustomAddPhoneNumView;
@protocol AJEditCustomAddPhoneNumViewDelegate <NSObject>
@optional
- (void)phoneNumView:(AJEditCustomAddPhoneNumView *)phoneView textField:(UITextField *)textField;

@end
@interface AJEditCustomAddPhoneNumView : UIView

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (weak, nonatomic)id<AJEditCustomAddPhoneNumViewDelegate> delegate;

- (IBAction)deleteBtnClicked:(id)sender;
@end
