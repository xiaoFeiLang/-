//
//  SettingVC.m
//  九张
//
//  Created by loulou on 16/6/24.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "SettingVC.h"
#import "LoginVC.h"
#import "TestPopView.h"
#import "AViewController.h"

typedef NS_ENUM (NSInteger,UserSex) {
    UserSexMan,
    UserSexWoman
};
@interface SettingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (strong, nonatomic) TestPopView *shareView;
@property (nonatomic, assign) BOOL isAnimated;
@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    NSString *str = @"A B C D E F 登陆";
    self.dataSource = [str componentsSeparatedByString:@" "];
    self.isAnimated = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    self.cnBar.title = @"设置";
    __weak typeof(self)weakSelf = self;
    [self.cnBar setRightButtonWithString:@"退出" click:^(UIButton *rightButton) {
        [weakSelf popTestView];
        //        [weakSelf logout];
    }];

}
- (void)popTestView{
   
    __weak typeof(self)weakSelf = self;
    if (self.isAnimated) {
        
        weakSelf.shareView = [[TestPopView alloc] init];
        [weakSelf.view addSubview:weakSelf.shareView];
        [weakSelf.shareView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(weakSelf.tableView);
        }];
        [self.view layoutIfNeeded];
        self.view.userInteractionEnabled = false;
        [self.shareView startAnimation];
        [self shareViewMessageSend];
        self.isAnimated = NO;
    } else {
        [self.shareView dismissd];
        [self shareViewMessageSend];
    }
    
   
}
-(void)shareViewMessageSend{
    
    WEAK_SELF
    self.shareView.dismiss = ^{
        wself.isAnimated = YES;
        [wself.shareView removeFromSuperview];
        wself.shareView = nil;
        
    };
    self.shareView.display = ^{
        
        wself.view.userInteractionEnabled = true;
    };
//    self.shareView.selectIndex = ^(NSInteger index){
//        
//        [wself selectShareIndex:index];
//        
//    };
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return RC_Y(80);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.row == 0) {
        AViewController *vc = [[AViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
    if (indexPath.row == 6) {
        LoginVC *vc = [[LoginVC alloc] init];
        [self presentViewController:vc animated:true completion:nil];
    }
}

#pragma mark - logout
- (void)logout{
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
    //获取storyboard
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //    //获取注销后要跳转的页面
    //    id view = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    //    //模态展示出登陆页面
    //    [self presentViewController:view animated:YES completion:^{
    //    }];
    LoginVC *vc = [[LoginVC alloc] init];
    [self presentViewController:vc animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
