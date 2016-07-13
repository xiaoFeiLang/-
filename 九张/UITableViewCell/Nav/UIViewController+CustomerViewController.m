//
//  UIViewController+CustomerViewController.m
//  FunctionProject
//
//  Created by loulou on 16/5/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "UIViewController+CustomerViewController.h"
#import <objc/runtime.h>
@implementation UIViewController (CustomerViewController)

-(void)setCnBar:(CustomerNavigationBar *)cnBar{
    
    objc_setAssociatedObject(self, @selector(cnBar), cnBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CustomerNavigationBar *)cnBar{
    
    return objc_getAssociatedObject(self, @selector(cnBar));
}

-(void)setIsNotPop:(BOOL)isNotPop{
    
    objc_setAssociatedObject(self, @selector(isNotPop), [NSNumber numberWithBool:isNotPop], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isNotPop{
    
    return [objc_getAssociatedObject(self, @selector(isNotPop)) boolValue];
}

@end
