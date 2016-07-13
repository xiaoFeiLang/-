//
//  ViewController.m
//  九张
//
//  Created by loulou on 16/6/13.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TestModel.h"
#import "Masonry.h"
#import "LoginVC.h"
#import "AdvertisingScrollView.h"

//设备屏幕的宽
#define screen_width [UIScreen mainScreen].bounds.size.width
//设备屏幕的高
#define screen_height [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) AdvertisingScrollView *scrollView;

@end

@implementation ViewController{

//    CGFloat screenW;
    
}

/*- (void)viewDidLoad {
    [super viewDidLoad];
    self.pictureV = [[UIView alloc] init];
    self.pictureV.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.pictureV];
    for (UIView *view in self.pictureV.subviews) {
        [view removeFromSuperview];
    }
    NSInteger pictureList = 9;
    CGFloat contentW = screen_width - 20;
   
    
    CGFloat picBorder = screenW * 25.0/1080.0;
    CGFloat picW = (contentW-2*picBorder)/3.0;
//    CGFloat panding = (screenW - 3*picW) /4;
   
    
    //行数
    NSInteger picRow;
    if (pictureList%3 == 0) {
        picRow = pictureList/3;
    }else{
        picRow = pictureList/3+1;
    }
    
    CGRect pictureVFrame = CGRectMake(20, 100, contentW, picRow*(picW+picBorder)+picBorder);
    self.pictureV.frame = pictureVFrame;
    
    for (int i = 0; i < pictureList; i++){
        
        UIImageView *picImageView = [[UIImageView alloc] initWithFrame:CGRectMake((i%3)*(picW+picBorder), picBorder+(picW+picBorder)*(i/3), 100, 100)];
        picImageView.backgroundColor = [UIColor grayColor];
        [self.pictureV addSubview:picImageView];
    }
    
}*/


- (AdvertisingScrollView *)scrollView{

    if (_scrollView == nil) {
        NSArray *imagsArray = @[@"01",@"02",@"03",@"04",];
        _scrollView = [[AdvertisingScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width ,180)];
        [_scrollView initializationUIWithDataArray:imagsArray];
        self.tableView.tableHeaderView = _scrollView;
        
    }
    return _scrollView;
}

//- tableheaderview
- (void)viewDidLoad{
    
    [super viewDidLoad];
//    NSArray *imagsArray = @[@"01",@"02",@"03",@"04",];
//    AdvertisingScrollView *scrollView = [[AdvertisingScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width ,200)];
//    [scrollView initializationUIWithDataArray:imagsArray];
//    [scrollView setAnimationDuration:1.5];
//    [self.view addSubview:scrollView];

   //    ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊ 九张图 折叠展开 ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
//    self.tableView.allowsSelection = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];
    [self.scrollView setAnimationDuration:1.5];
    self.dataSource = [NSMutableArray array];
    TestModel *model1 = [[TestModel alloc] init];
    model1.title = @"sdfsddfdsfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfss";
    
    TestModel *model2 = [[TestModel alloc] init];
    model2.title = @"sdfsddfdsfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfss";
    
    TestModel *model3 = [[TestModel alloc] init];
    model3.title = @"sdfsddfdsfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfssdfsdfsdfsdfsdfdfdsfss";
    
    [self.dataSource addObject:model1];
    [self.dataSource addObject:model2];
    [self.dataSource addObject:model3];
   
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self.cnBar setDisplayLeftIcon:false];
    [self.cnBar setTitle:@"首页"];
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    cell.indexPath = indexPath;
    cell.expandBtn.tag = indexPath.row;
    cell.clickBlock = ^(NSIndexPath *path){
        [self click:path];
    };
    [cell configCell:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"TestCell" configuration:^(TestCell *cell) {
        [cell configCell:self.dataSource[indexPath.row]];
    }];
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)click:(NSIndexPath *)path{
    
    TestCell *cell = [self.tableView cellForRowAtIndexPath:path];
    TestModel *model = self.dataSource[path.row];
    model.isContentExpanded = !model.isContentExpanded;
    [cell configCell:model];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
