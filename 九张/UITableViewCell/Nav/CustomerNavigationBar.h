//
//  CustomerNavigationBar.h
//  FunctionProject
//
//  Created by loulou on 16/5/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerNavigationItem.h"

typedef void(^hiddenBarBlock)(UIView *navView);
typedef void(^clickReturnBlock)(UIButton *returnButton);
typedef void(^clickLeftBlock)(UIButton *leftButton);
typedef void(^clickRightBlock)(UIButton *rightButton);
typedef void(^addOther)(UIButton *sender);

@interface CustomerNavigationBar : UINavigationBar

@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIColor *baseColor;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *rightTitle;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, assign) BOOL displayLeftIcon;
@property (nonatomic, assign) BOOL displayRightIcon;
@property (nonatomic, copy) clickReturnBlock clickReturn;

-(void)setLeftButton:(UIImage *)leftIcon click:(clickLeftBlock)leftClick;
-(void)setRightButton:(UIImage *)rightIcon click:(clickRightBlock)rightClick;


-(void)setRightButtonWithString:(NSString *)title click:(clickRightBlock)rightClick;

- (void)setOtherLeftButton:(UIImage *)leftIcon addOther:(addOther)other click:(clickLeftBlock)leftButton;
- (void)setOtherRightButton:(UIImage *)leftIcon addOther:(addOther)other click:(clickRightBlock)rightButton;

@end
