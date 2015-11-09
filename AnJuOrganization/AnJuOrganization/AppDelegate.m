//
//  AppDelegate.m
//  AnJuOrganization
//
//  Created by 王鹏 on 15/11/3.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "WellChosenViewController.h"
#import "SaleChampionViewController.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置主窗口,并设置跟控制器
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self setTabbarViewController];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self.window setRootViewController:self.myTabbar];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)setTabbarViewController
{
    WellChosenViewController *wellChosenVC = [[WellChosenViewController alloc] init];
    CustomNavigationBarController *wellChosenNav = [[CustomNavigationBarController alloc] initWithRootViewController:wellChosenVC];
    SaleChampionViewController *saleChampionVC = [[SaleChampionViewController alloc] init];
    CustomNavigationBarController *saleChampionNav = [[CustomNavigationBarController alloc] initWithRootViewController:saleChampionVC];
    MyViewController *myVC = [[MyViewController alloc] init];
    CustomNavigationBarController *myNav = [[CustomNavigationBarController alloc] initWithRootViewController:myVC];
    CYLTabBarController *myTabbar = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController:myTabbar];
    [myTabbar setViewControllers:@[wellChosenNav,
                                   saleChampionNav,
                                   myNav
                                   ]];
    self.myTabbar = myTabbar;
}
/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"精选",
                            CYLTabBarItemImage : @"wellChosen_normal",
                            CYLTabBarItemSelectedImage : @"wellChosen_highlight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"经纪",
                            CYLTabBarItemImage : @"sale_normal",
                            CYLTabBarItemSelectedImage : @"sale_hignlight",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"个人",
                            CYLTabBarItemImage : @"my_normal",
                            CYLTabBarItemSelectedImage : @"my_highlight",
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
