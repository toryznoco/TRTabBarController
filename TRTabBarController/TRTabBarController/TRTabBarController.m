//
//  TRTabBarController.m
//  TRTabBarController
//
//  Created by Tory on 2016/12/14.
//  Copyright © 2016年 toryznoco. All rights reserved.
//

#import "TRTabBarController.h"

@interface TRTabBarController ()

@end

@implementation TRTabBarController

#pragma mark - 懒加载
- (UIButton *)plusBtn {
    if (!_plusBtn) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tabBar addSubview:_plusBtn];
    }
    return _plusBtn;
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    // 如果没有plusBtn就直接设置
    if (!_plusBtn) {
        [super setViewControllers:viewControllers];
        return;
    }
    
    // 如果有plusBtn
    NSMutableArray *vcArr = [viewControllers mutableCopy];
    
    // 添加占位控制器
    UIViewController *plusVC = [[UIViewController alloc] init];
    [vcArr insertObject:plusVC atIndex:vcArr.count/2];
    
    // 设置tabBarController子控制器
    [super setViewControllers:[vcArr copy]];
    
    // 在设置子控制器之后再添加plusBtn，不然会被UITabBarButton挡住
    // 并把加号按钮添加到tabBar上
    [self.tabBar addSubview:_plusBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
