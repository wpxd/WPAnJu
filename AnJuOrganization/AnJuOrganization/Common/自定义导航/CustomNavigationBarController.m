//
//  CustomNavigationBarController.m
//  Fangdd
//
//  Created by guoning on 14-3-12.
//  Copyright (c) 2014年 guoning. All rights reserved.
//

#import "CustomNavigationBarController.h"

@interface CustomNavigationBarController ()

@end

@implementation CustomNavigationBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        if(isIOS7){
            self.navigationBar.translucent = NO;
            [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
            [[UINavigationBar appearance] setBarTintColor:UIColorFromHex(0xf5f5f5)];
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
            
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }else{
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navgationbar.png"] forBarMetrics:UIBarMetricsDefault];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
