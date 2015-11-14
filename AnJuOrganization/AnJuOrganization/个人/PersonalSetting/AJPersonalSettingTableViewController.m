//
//  AJPersonalSettingTableViewController.m
//  AnJuOrganization
//
//  Created by xuqianlong on 15/11/13.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJPersonalSettingTableViewController.h"

@interface AJPersonalSettingTableViewController ()

@end

@implementation AJPersonalSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    self.tableView.contentInset = UIEdgeInsetsMake(-22, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
