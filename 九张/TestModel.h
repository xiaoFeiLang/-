//
//  TestModel.h
//  九张
//
//  Created by loulou on 16/6/23.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (strong, nonatomic) NSIndexPath* indexPath;
@property (assign, nonatomic) BOOL isContentExpanded;
@end
