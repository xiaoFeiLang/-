//
//  TestCell.h
//  九张
//
//  Created by loulou on 16/6/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock)(NSIndexPath *);

@interface TestCell : UITableViewCell
@property (nonatomic, strong) UIView *contentV;
@property (nonatomic, strong) UIView *pictureV;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *expandBtn;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy) ClickBlock clickBlock;

- (void)configCell:(id)model;

@end
