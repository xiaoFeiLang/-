//
//  UIViewController+CustomerViewController.h
//  FunctionProject
//
//  Created by loulou on 16/5/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerNavigationBar.h"

@interface UIViewController (CustomerViewController)
@property(strong, nonatomic) CustomerNavigationBar *cnBar;
@property(assign, nonatomic) BOOL isNotPop;
@end
