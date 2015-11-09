//
//  ViewController.m
//  YiDingYing
//
//  Created by 二亮子 on 15/9/15.
//  Copyright (c) 2015年 二亮子. All rights reserved.
//

#import "ViewController.h"
#import "Creditease.h"
#import "RootController.h"
#import "RootView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Creditease *c = [Creditease new];
    [c crediteaseTest];
    RootController *r = [RootController new];
    [r testRoot];
    
    RootView *rv = [[NSBundle mainBundle] loadNibNamed:@"RootView" owner:self options:nil][0];
    [self.view addSubview:rv];
    NSLog(@"home is %@", NSHomeDirectory());
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    iv.image = [UIImage imageNamed:@"111.jpg"];
    [self.view addSubview:iv];
}

@end
