//
//  LSTabBar.m
//  FunctionProject
//
//  Created by loulou on 16/5/22.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "LSTabBar.h"
#import "UIView+frame.h"

NSString * const kCameraNotice = @"kCameraNotice";

@interface LSTabBar()

@property(nonatomic, weak) UIButton *photoButton;

@end

@implementation LSTabBar

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 withSize:(CGSize) size{
    
    UIGraphicsBeginImageContext(size);
    [image1 drawInRect:(CGRect){{0,0}, size}];
    [image2 drawInRect:CGRectMake(10, 10, size.width - 20, size.height - 20)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat h = self.frame.size.height;
    
    CGFloat buttonH = h;
    CGFloat buttonW = screenW / 5;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    
    int index = 0;
    
    for (UIView *view in self.subviews) {
        if (![NSStringFromClass(view.class) isEqualToString:@"UITabBarButton"]) continue;
    
        buttonX = index * buttonW;
        
        view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index ++;
    }
}


@end
