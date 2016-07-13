//
//  TestPopView.h
//  九张
//
//  Created by loulou on 16/6/27.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^dismissView)(void);
typedef void (^displayView)(void);
typedef void (^selectView)(void);

@interface TestPopView : UIView

@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) UIView *backView;

@property (nonatomic, copy) dismissView dismiss;
@property (nonatomic, copy) displayView display;
@property (nonatomic, copy) selectView selectView;

- (void)startAnimation;
- (void)dismissd;
@end
