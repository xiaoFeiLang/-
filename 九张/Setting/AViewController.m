//
//  AViewController.m
//  九张
//
//  Created by loulou on 16/6/27.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "AViewController.h"
#import "UIButton+LZCategory.h"

@interface AViewController ()
@property(nonatomic, assign) BOOL isAnimated;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isAnimated = NO;
    [self.btn1 LZSetbuttonType:LZCategoryTypeBottom];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    if (_isAnimated) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:2.0];
        [self.theView setFrame:CGRectMake(100, 200, 160, 150)];
        [UIView commitAnimations];
        self.isAnimated = NO;
    } else {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:2.0];
        [self.theView setFrame:CGRectMake(0, 0, 320, 300)];
        [UIView commitAnimations];
        self.isAnimated = YES;
    }
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
