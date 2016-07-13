//
//  TestCell.m
//  九张
//
//  Created by loulou on 16/6/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"
#import "TestModel.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define P_X(x)                  x / 640.f
#define P_Y(y)                  y / 1136.f
#define RC_X(x)                 P_X(x) * ([UIScreen mainScreen].bounds.size.width < 320.f ? 320.f : [UIScreen mainScreen].bounds.size.width)
#define RC_Y(y)                 P_Y(y) * ([UIScreen mainScreen].bounds.size.height < 568.f ? 568.f : [UIScreen mainScreen].bounds.size.height)
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
@implementation TestCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentV = [[UIView alloc] init];
//        self.contentView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.contentV];
        
        self.pictureV = [[UIView alloc] init];
//        self.pictureV.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.pictureV];

        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font= [UIFont systemFontOfSize:14];
     
        [self.contentLabel sizeToFit];
        [self.contentV addSubview:self.contentLabel];
        
        self.expandBtn = [[UIButton alloc] init];
        [self.expandBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.expandBtn setTitleColor:RGBCOLOR(27, 188, 155) forState:UIControlStateNormal];
        [self.expandBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentV addSubview:self.expandBtn];
        
        [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(RC_Y(20));
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentV);
            make.left.and.top.equalTo(self.contentV).offset(RC_X(20));
            make.right.equalTo(self.contentV).offset(-RC_X(20));
        }];
        [self.expandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(RC_Y(20));
            make.left.equalTo(self.contentV).offset(RC_X(20));
            make.bottom.equalTo(self.contentV);
        }];

        [self.pictureV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentV.mas_bottom).offset(RC_Y(20));
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
    }
    return self;
}

- (void)clickBtn:(UIButton *)sender{

    if (self.clickBlock) {
        self.clickBlock(self.indexPath);
    }
}

- (void)configCell:(id)model{
    TestModel *testModel = model;
    self.contentLabel.text = testModel.title;

    if (testModel.isContentExpanded == NO) {
        
        self.contentLabel.numberOfLines = 2;
        [self.expandBtn setTitle:@"详情" forState:UIControlStateNormal];
        

    }else{
        [self.expandBtn setTitle:@"收起" forState:UIControlStateNormal];
        self.contentLabel.numberOfLines = 0;

    }

//    UIImageView *lastLabel = nil;
//    NSArray *picArray = @[@"flower.jpg",@"flower.jpg",@"flower.jpg",@"flower.jpg"];
//    for (int i = 0; i < picArray.count; i++) {
//
//        UIImageView *label = [UIImageView new];
//        label.image = [UIImage imageNamed:picArray[i]];
//        [self.pictureV addSubview:label];
//        
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            //设置高度
//            make.height.offset(40.0f);
//            
//            //计算距离顶部的公式 60 = 上一个距离顶部的高度 + UIlabel的高度
//            float colTop = (20 + i/3 * 60.0f);
//            
//            make.top.offset(colTop);
//            
//            //当是 左边一列的时候 都是 距离父视图 向左边 20的间隔
//            if (i%3 == 0) {
//                
//                make.left.offset(20.0f);
////                make.right.equalTo(self.contentView).offset(screen_width - 20 + );
//                
//            }else{
//                
//                //当时中间列的时候 在上一个UIlabel的右边 添加20个 距离 并且设置等高
//                make.width.equalTo(lastLabel.mas_width);
//                make.left.equalTo(lastLabel.mas_right).offset(20.0f);
//                
//                
//            }
//            //当是 最右边列的时候 距离右边父视图的 距离为20  因为是向左所以是-20  控制底部也是 负数!!
//            if (i%3 == 2) {
//                
//                make.right.offset(-20.0f);
//                
//            }
//            
//        }];
//        lastLabel = label;
//    }
//    for (UIView *view in self.pictureV.subviews) {
//        if (view) {
//            
//            [view removeFromSuperview];
//        }
//    }
    
    __block UIView *lastView = nil;
    // 间距为10
    int intes = 10;
    // 每行3个
    int num = 3;
    NSInteger count = 4;
    // 循环创建view
    for (int i = 0; i < count; i++) {
        
        UIView *view = [UIView new];
        [self.pictureV addSubview:view];
        view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
        
        // 添加约束
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            // 给个高度约束
            make.height.mas_equalTo(80);
            
            // 1. 判断是否存在上一个view
            if (lastView) {
                // 存在的话宽度与上一个宽度相同
                make.width.equalTo(lastView);
            } else {
                // 否则计算宽度  ！！！此处的判断条件是为了避免 最后一列约束冲突
                /**
                 *  这里可能大家会问 为什么上面我说最后一列会有冲突？
                 *  如果不添加判断的话会造成：
                 *  1添加了宽度约束 2所有列加了左侧约束 第3步给 最后一列添加了右侧约束
                 *  这里最后一列既有左侧约束又有右侧约束还有宽度约束 会造成约束冲突
                 *  所以这里添加宽度时将最后一列剔除
                 */
                if (i % num != 0) {
                    make.width.mas_equalTo((view.superview.frame.size.width - (num + 1)* intes)/4);
                }
            }
            // 2. 判断是否是第一列
            if (i % num == 0) {
                // 一：是第一列时 添加左侧与父视图左侧约束
                make.left.mas_equalTo(view.superview).offset(intes);
            } else {
                // 二： 不是第一列时 添加左侧与上个view左侧约束
                make.left.mas_equalTo(lastView.mas_right).offset(intes);
            }
            // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
            if (i % num == (num - 1)) {
                make.right.mas_equalTo(view.superview).offset(-intes);
            }
            // 4. 判断是否为第一行
            if (i / num == 0) {
                // 第一列添加顶部约束
                make.top.mas_equalTo(view.superview).offset(10);
            } else {
                // 其余添加顶部约束 intes*10 是我留出的距顶部高度
                make.top.mas_equalTo( 10 + ( i / num )* (80 + intes));
                
            }
            //判断是否是最后一行，如果是添加底部约束
             if (i / num == count/num) {
//                make.top.mas_equalTo( 10 + ( i / num )* (80 + intes));
                make.bottom.equalTo(self.pictureV);
            }
            
//                if (lastView) {
//                make.bottom.equalTo(self.contentView);
//            }
            
        }];
        // 每次循环结束 此次的View为下次约束的基准
        lastView = view;
        
    }

}

- (CGFloat)TextWidth:(NSString *)str2 FontSize:(CGFloat)fontsize Height:(CGFloat)height{
    NSString *str=[NSString stringWithFormat:@"%@",str2];
    CGSize constraint = CGSizeMake(MAXFLOAT, height);
    UILabel *lbl = [[UILabel alloc]init];
    UIFont *font =[UIFont fontWithName:lbl.font.familyName size:fontsize];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    CGSize size = [str boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading  attributes:dic context:nil].size;
    return size.width;
}

//固定宽度，获取字符串的高度
- (CGFloat)TextHeight:(NSString *)str2 FontSize:(CGFloat)fontsize Width:(CGFloat)width{
    NSString *str=[NSString stringWithFormat:@"%@",str2];
    CGSize constraint = CGSizeMake(width, MAXFLOAT);
    UILabel *lbl = [[UILabel alloc]init];
    UIFont *font =[UIFont fontWithName:lbl.font.familyName size:fontsize];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    CGSize size = [str boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading  attributes:dic context:nil].size;
    
    return size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
