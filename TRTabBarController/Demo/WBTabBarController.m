//
//  WBTabBarController.m
//  TRTabBarController
//
//  Created by Tory on 2016/12/14.
//  Copyright © 2016年 toryznoco. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBHomeVC.h"
#import "WBMessageVC.h"
#import "WBPublishVC.h"
#import "WBDiscoverVC.h"
#import "WBMineVC.h"

@interface WBTabBarController ()

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPlusBtn];
    [self setupChildViewControllers];
    
    // 设置tabbar颜色
    self.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:130/255.0 blue:1/255.0 alpha:1];
}

- (void)setupPlusBtn {
    [self.plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [self.plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self.plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [self.plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [self.plusBtn sizeToFit];
    [self.plusBtn addTarget:self action:@selector(plusBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupChildViewControllers {
    self.plusBtn.center = CGPointMake(self.tabBar.bounds.size.width * 0.5, self.tabBar.bounds.size.height * 0.5);
    // 主页
    WBHomeVC *homeVC = [[WBHomeVC alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
    
    // 消息
    WBMessageVC *messageVC = [[WBMessageVC alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_selected"]];
    
    // 发现
    WBDiscoverVC *discoverVC = [[WBDiscoverVC alloc] init];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    discoverNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected"]];
    
    // 我
    WBMineVC *mineVC = [[WBMineVC alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    
    self.viewControllers = @[homeNav, messageNav, discoverNav, mineNav];
}

- (void)plusBtnClicked:(UIButton *)plusBtn {
    NSLog(@"点了加号按钮");
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
