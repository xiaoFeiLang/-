//
//  TestPopView.m
//  九张
//
//  Created by loulou on 16/6/27.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "TestPopView.h"

@implementation TestPopView

- (instancetype)init{

    if (self = [super init]) {
        self.clipsToBounds = true;
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor colorWithWhite:255 alpha:0.5];
        self.backView.alpha = 0.f;
        [self addSubview:self.backView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissd)];
        [self.backView addGestureRecognizer:tap];
        
        self.popView = [[UIView alloc] init];
        self.popView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.popView];
        
        [self.popView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@(RC_Y(200)));
            make.top.equalTo(@(-RC_Y(200)));
        }];
        
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)startAnimation{

    [self layoutIfNeeded];
    [self.popView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
    }];
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        
        [weakSelf layoutIfNeeded];
        weakSelf.backView.alpha = 1.f;
    }completion:^(BOOL finished) {
        if (self.display) {
            self.display();
        }
    }];
    
}

- (void)dismissd{

    [self layoutIfNeeded];
    [self.popView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(-RC_Y(200)));
    }];
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        [weakSelf layoutIfNeeded];
         weakSelf.backView.alpha = 0.f;
    }completion:^(BOOL finished) {
        if (self.dismiss) {
            self.dismiss();
        }
    }];
}
@end
