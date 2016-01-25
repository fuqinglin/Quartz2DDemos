//
//  SelectView.h
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//



#import <UIKit/UIKit.h>

static NSString *const SelectColorNotification = @"color";
static NSString *const SelectLineNotification = @"line";


@protocol SelectViewDelegate <NSObject>

- (void)clickSelectViewColor:(UIColor *)color;

@end

@interface SelectView : UIView
@property (weak, nonatomic) id<SelectViewDelegate>delegate;

// 显示颜色选择面板
+ (void)showColorSelectView;

// 显示线宽选择面板
+ (void)showLineView;

// 隐藏选择面板
+ (void)hiddenLineView;

+ (void)hiddenSelectColorView;

@end
