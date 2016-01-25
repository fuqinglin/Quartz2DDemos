//
//  DrawView.h
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

@property (assign, nonatomic)CGFloat lineWidth;
@property (strong, nonatomic)UIColor *lineColor;

// 撤销操作
- (void)repealLine;

// 清除操作
- (void)clearLines;

@end
