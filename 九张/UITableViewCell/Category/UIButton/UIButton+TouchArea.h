//
//  UIButton+TouchArea.h
//  RMEducation
//
//  Created by tongbinLi on 16/3/29.
//  Copyright © 2016年 tongbinLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TouchArea)

-(BOOL)setBackgroundImage:(UIImage *)image forState:(UIControlState)state minSize:(CGSize)minSize;
@end
