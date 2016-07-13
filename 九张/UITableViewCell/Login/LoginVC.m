//
//  LoginVC.m
//  九张
//
//  Created by loulou on 16/6/24.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "LoginVC.h"
#import "Masonry.h"
#import "ViewController.h"
@interface LoginVC ()
@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.usernameTextField = [[UITextField alloc] init];
    self.usernameTextField.placeholder = @"请输入姓名";
    [self.view addSubview:self.usernameTextField];
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -30));
    }];
    
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.placeholder = @"请输入密码";
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];

    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, 30));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - login action
-(void)login{
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    //对用户信息的验证
    if ([username isEqualToString:password]){
        //获取userDefault单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //登陆成功后把用户名和密码存储到UserDefault
        [userDefaults setObject:username forKey:@"name"];
        [userDefaults setObject:password forKey:@"password"];
        [userDefaults synchronize];
        //用模态跳转到主界面
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //        id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainView"];
        //        [self presentViewController:mainViewController animated:YES completion:^{
        //        }];
//        ViewController *vc = [[ViewController alloc] init];
        [self dismissViewControllerAnimated:true completion:nil];
        NSLog(@"Success");
    }
}

@end
