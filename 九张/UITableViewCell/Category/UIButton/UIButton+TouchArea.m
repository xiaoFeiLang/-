//
//  UIButton+TouchArea.m
//  RMEducation
//
//  Created by tongbinLi on 16/3/29.
//  Copyright © 2016年 tongbinLi. All rights reserved.
//

#import "UIButton+TouchArea.h"

@implementation UIButton (TouchArea)

-(BOOL)setBackgroundImage:(UIImage *)image forState:(UIControlState)state minSize:(CGSize)minSize{
    
    BOOL isReturn = false;
    if (image.size.width >= minSize.width && image.size.height >= minSize.height) {
        
        isReturn = true;
        [self setBackgroundImage:image forState:state];
    }else{
        
        UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self);
        }];
    }
    
    return isReturn;
}
@end
