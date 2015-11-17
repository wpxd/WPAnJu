//
//  AJLoginViewController.m
//  AnJuOrganization
//
//  Created by xuqianlong on 15/11/17.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJLoginViewController.h"

@interface AJLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *topBgView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation AJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topBgView.layer.cornerRadius = 4;
    self.topBgView.layer.masksToBounds = YES;
    self.topBgView.layer.borderColor = [UIColorFromHex(0xd2d2d2) CGColor];
    self.topBgView.layer.borderWidth = 1;
    self.loginBtn.layer.cornerRadius = 4;
    self.loginBtn.layer.masksToBounds = YES;
}

- (IBAction)tapLoginAction:(id)sender {
}

- (IBAction)tapForgetPwdAction:(id)sender {
}

- (IBAction)tapRegistAction:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
