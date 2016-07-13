//
//  CustomerNavigationBar.m
//  FunctionProject
//
//  Created by loulou on 16/5/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "CustomerNavigationBar.h"
#import "UIButton+TouchArea.h"
@interface CustomerNavigationBar()

@property(copy, nonatomic) clickLeftBlock clickLeftBlock;
@property(copy, nonatomic) clickRightBlock clickRightBlock;

@end

@implementation CustomerNavigationBar

- (instancetype)init{
    self = [super init];
    if (self) {
        if (!self.baseView) {
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            self.baseView = [[UIView alloc] init];
            self.baseView.frame = CGRectMake(0, 0, width, 64);
            [self setBaseColor:[UIColor whiteColor]];
        }
        self.displayLeftIcon = true;
    }
    return self;
}

- (void)setBaseColor:(UIColor *)baseColor{
    if (_baseView) {
        _baseView.backgroundColor = baseColor;
        _baseView.tintColor = baseColor;
    }
    _baseColor = baseColor;
}

- (void)setHidden:(BOOL)hidden{

    self.baseView.hidden = hidden;
}

- (void)setTitle:(NSString *)title{
    
    if (title) {
        [[self.baseView viewWithTag:1002] removeFromSuperview];
        _title = title;
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.tag = 1002;
        label.text = title;
        label.textColor = [UIColor blackColor];
        [self.baseView addSubview:label];
        
        WEAK_SELF
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(wself.baseView);
            make.top.equalTo(wself.baseView).offset(20);
        }];
    }
}

- (void)setLeftTitle:(NSString *)leftTitle{
    if (!_displayLeftIcon) {
        if (self.leftButton) {
            [self.leftButton setTitle:leftTitle forState:UIControlStateNormal];
        } else {
        
        }
    }
}

- (void)setRightTitle:(NSString *)rightTitle{
    if (!_displayRightIcon) {
        if (self.rightButton) {
            [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];
        } else {
            
        }
    }
}

- (void)setDisplayLeftIcon:(BOOL)displayLeftIcon{
    if (displayLeftIcon) {
        if (!self.leftButton) {
            self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.baseView addSubview:self.leftButton];
        }
        
        BOOL isReturn = [self.leftButton setBackgroundImage:LOAD_IMAGE(@"arrow_whiet") forState:UIControlStateNormal minSize:CGSizeMake(50, 50)];
        [self.leftButton addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
        WEAK_SELF
        CGFloat left = isReturn ? 20 : 0;
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50.0, 50.0));
            make.centerY.equalTo(wself.baseView).offset(10);
            make.left.equalTo(@(left));
        }];
    } else {
        [self.leftButton removeFromSuperview];
    }
    
    _displayLeftIcon = displayLeftIcon;
}

- (void)clickReturn:(UIButton *)sender{
    
    if (self.clickReturn) {
        self.clickReturn(sender);
    }
}

- (void)setLeftButton:(UIImage *)leftIcon click:(clickLeftBlock)leftClick{
    
    self.clickLeftBlock = leftClick;
    self.displayLeftIcon = false;
    [self.leftButton removeFromSuperview];
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.baseView addSubview:self.leftButton];
    BOOL isReturn = [self.leftButton setBackgroundImage:leftIcon forState:UIControlStateNormal minSize:CGSizeMake(RC_X(50), RC_Y(50))];
    CGFloat left = RC_X(24.f);
    if (!isReturn && leftIcon)
        left = RC_X(24.f) - (RC_X(50.f) - leftIcon.size.width) / 2.f;
    
    [self.leftButton addTarget:self action:@selector(clickCustomizeLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    WEAK_SELF
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wself.baseView).offset(10);
        make.left.equalTo(@(left));
    }];
    [self.baseView layoutIfNeeded];

}


-(void)setOtherLeftButton:(UIImage *)leftIcon addOther:(addOther)other click:(clickLeftBlock)leftButtonClick{
    
    [self setLeftButton:leftIcon click:leftButtonClick];
    if (other) {
        other(self.leftButton);
    }
}

-(void)setOtherRightButton:(UIImage *)rightIcon addOther:(addOther)other click:(clickRightBlock)rightButtonClick{
    
    [self setRightButton:rightIcon click:rightButtonClick];
    if (other) {
        other(self.rightButton);
    }
}

-(void)setRightButton:(UIImage *)rightIcon click:(clickRightBlock)customizeRightBlock{
    
    self.clickRightBlock = customizeRightBlock;
    [self.rightButton removeFromSuperview];
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.baseView addSubview:self.rightButton];
    BOOL isReturn = [self.rightButton setBackgroundImage:rightIcon forState:UIControlStateNormal minSize:CGSizeMake(RC_X(50.f), RC_Y(50.f))];
    CGFloat left = RC_X(-24.f);
    if (!isReturn && rightIcon)
        left = (RC_X(50.f) - rightIcon.size.width) / 2.f - RC_X(24.f);
    [self.rightButton addTarget:self action:@selector(clickCustomizeRightButton:) forControlEvents:UIControlEventTouchUpInside];
    WEAK_SELF
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wself.baseView).offset(10);
        make.right.equalTo(@(left));
    }];
}

-(void)setRightButtonWithString:(NSString *)title click:(clickRightBlock)customizeRightBlock{
    
    self.clickRightBlock = customizeRightBlock;
    [self.rightButton removeFromSuperview];
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.baseView addSubview:self.rightButton];
    [self setRightTitle:title];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat left = RC_X(-24.f);
    if (title)
//        left = (RC_X(50.f) - title.size.width) / 2.f - RC_X(24.f);
    [self.rightButton addTarget:self action:@selector(clickCustomizeRightButton:) forControlEvents:UIControlEventTouchUpInside];
    WEAK_SELF
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wself.baseView).offset(10);
        make.right.equalTo(@(left));
    }];
}
//
//-(void)customizeRightButton:(UIImage *)rightIcon addOther:(addOther)other click:(clickRightBlock)clickRight{
//    
//    [self setRightButton:rightIcon click:clickRight];
//    if (other) {
//        
//        other(self.rightButton);
//    }
//}

-(void)clickCustomizeLeftButton:(UIButton *)sender{
    
    if (self.clickLeftBlock) {
        
        self.clickLeftBlock(sender);
    }
}

-(void)clickCustomizeRightButton:(UIButton *)sender{
    
    if (self.clickRightBlock) {
        
        self.clickRightBlock(sender);
    }
}
@end

