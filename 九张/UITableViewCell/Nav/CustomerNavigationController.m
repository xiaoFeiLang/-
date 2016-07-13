//
//  CustomerNavigationController.m
//  FunctionProject
//
//  Created by loulou on 16/5/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "CustomerNavigationController.h"
#import "UIViewController+CustomerViewController.h"

@interface CustomerNavigationController ()

@end

@implementation CustomerNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationBar.hidden = true;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (!viewController.cnBar) {
        
        WEAK_SELF
        CustomerNavigationBar *bar = [[CustomerNavigationBar alloc]init];
        [viewController.view addSubview:bar.baseView];
        viewController.cnBar = bar;
        bar.clickReturn = ^(UIButton *sender){
            
            [wself clickReturn:sender];
        };
    }
    [super pushViewController:viewController animated:animated];
    viewController.navigationController.interactivePopGestureRecognizer.enabled = !viewController.isNotPop;
}

-(void)clickReturn:(UIButton *)sender{
    
    [self popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
