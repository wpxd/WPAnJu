//
//  AJForgetPasswordViewController.m
//  AnJuOrganization
//
//  Created by xuqianlong on 15/11/14.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJForgetPasswordViewController.h"

@interface AJForgetPasswordViewController ()

@property (weak, nonatomic) IBOutlet UIView *topBgView;

@property (weak, nonatomic) IBOutlet UIButton *resetPswBtn;
@end

@implementation AJForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topBgView.layer.cornerRadius = 4;
    self.topBgView.layer.masksToBounds = YES;
    self.topBgView.layer.borderColor = [UIColorFromHex(0xd2d2d2) CGColor];
    self.topBgView.layer.borderWidth = 1;
    self.resetPswBtn.layer.cornerRadius = 4;
    self.resetPswBtn.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetPasswordAction:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
