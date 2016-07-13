//
//  CSTabBarController.m
//  FunctionProject
//
//  Created by loulou on 16/5/22.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "CSTabBarController.h"
#import "CSTabBar.h"

@interface CSTabBarController ()

@end

@implementation CSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setTabBaar {
    CSTabBar *tabBar = [[CSTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.barTintColor = [UIColor colorWithRed:0.910 green:0.925 blue:0.933 alpha:1.000];
    
    tabBar.tintColor = [UIColor redColor];
    
    tabBar.translucent = NO;
    
    //必须用kvc 赋值才可以替换系统自带的tabBar
    [self setValue:tabBar forKeyPath:@"tabBar"];
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
