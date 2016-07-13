//
//  CSTabBar.m
//  FunctionProject
//
//  Created by loulou on 16/5/22.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "CSTabBar.h"
#import "ViewController.h"
@interface CSTabBar ()

@property (nonatomic, strong) UIButton *plusButton;

@end

@implementation CSTabBar

//创建加号按钮
- (UIButton *)plusButton
{
    if (!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"Shopping-cart"] forState:(UIControlStateNormal)];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"Shopping-cart-selected"] forState:(UIControlStateNormal)];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"Shopping-cart-selected"] forState:(UIControlStateHighlighted)];
        [_plusButton addTarget:self action:@selector(plusButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
        
        //背景图多大，button多大
        [_plusButton sizeToFit];
        
        [self addSubview:_plusButton];
    }
    
    return _plusButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    int i = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            i ++;
        }
    }
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.3);
}

//加号按钮的方法实现
- (void)plusButtonAction {
    ViewController *plusVC = [[ViewController alloc] init];
    //kWindow为[UIApplication sharedApplication].keyWindow
    [self.window.rootViewController presentViewController:plusVC animated:YES completion:nil];
    
}
@end
