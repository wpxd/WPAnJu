//
//  AJAboutUSTableViewController.m
//  AnJuOrganization
//
//  Created by xuqianlong on 15/11/14.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJAboutUSTableViewController.h"

@interface AJAboutUSTableViewController ()

@end

@implementation AJAboutUSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
