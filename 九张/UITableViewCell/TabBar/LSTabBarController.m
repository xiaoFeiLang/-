//
//  LSTabBarController.m
//  FunctionProject
//
//  Created by loulou on 16/5/22.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "LSTabBarController.h"
#import "LSTabBar.h"
#import "ViewController.h"
#import "CustomerNavigationController.h"
#import "SettingVC.h"
@interface LSTabBarController ()

@end

@implementation LSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController];
    
    [self setupTabBar];

}

- (void)setupChildViewController {

    ViewController *vc2 = [[ViewController alloc] init];
    [self childViewController:vc2 imageName:@"tab_icon_dingdan" selectedImageName:@"tab_icon_dingdan_sel" withTitle:@"1"];
    vc2.view.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    [self childViewController:vc imageName:@"tab_icon_home" selectedImageName:@"tab_icon_home_sel" withTitle:@"2"];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc3 = [[ViewController alloc] init];
    [self childViewController:vc3 imageName:@"tab_icon_me" selectedImageName:@"tab_icon_me_sel" withTitle:@"3"];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc4 = [[ViewController alloc] init];
    [self childViewController:vc4 imageName:@"tab_icon_recommend" selectedImageName:@"tab_icon_recommend_sel" withTitle:@"4"];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    SettingVC *vc5 = [[SettingVC alloc] init];
    [self childViewController:vc5 imageName:@"tab_icon_recommend" selectedImageName:@"tab_icon_recommend_sel" withTitle:@"5"];
    vc.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)childViewController:(UIViewController *)vc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName withTitle:(NSString *)title{
    
    CustomerNavigationController *nav = [[CustomerNavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

- (void)setupTabBar{

    [self setValue:[[LSTabBar alloc] init ]forKeyPath:@"tabBar"];
    self.tabBar.tintColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
