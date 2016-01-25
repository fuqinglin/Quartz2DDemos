//
//  SelectView.m
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//


#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


#import "SelectView.h"


@interface SelectView ()

@property(nonatomic, strong) NSArray *selects;


@end

static UIView *selectColorView;
static UIView *selectLineWidthView;
NSArray *colors;

@implementation SelectView


+ (void)showLineView
{
    if (selectLineWidthView == nil) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        selectLineWidthView = [[UIView alloc] init];
        selectLineWidthView.frame = CGRectMake(kScreenWidth / 5 + 20, kScreenHeight, 40, 220);
        UISlider *slider = [[UISlider alloc] init];
        [slider addTarget:self action:@selector(selectLineWidth:) forControlEvents:UIControlEventValueChanged];
        slider.minimumValue = 1;
        slider.maximumValue = 100;
        slider.value = 2;
        slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
        slider.frame = CGRectMake(10, 20, 20, 200);
        [selectLineWidthView addSubview:slider];
        
        UILabel *widthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        widthLabel.textAlignment = NSTextAlignmentCenter;
        widthLabel.tag = 11;
        widthLabel.layer.borderWidth = 1;
        widthLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        widthLabel.font = [UIFont boldSystemFontOfSize:15];
        widthLabel.text = @"1";
        [selectLineWidthView addSubview:widthLabel];

        [keyWindow addSubview:selectLineWidthView];
    }
    
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        selectLineWidthView.transform = CGAffineTransformMakeTranslation(0, -270);
        
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - 显示颜色选择视图
+ (void)showColorSelectView
{
    if (selectColorView == nil) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        selectColorView = [[UIView alloc] init];
        selectColorView.frame = CGRectMake(5, kScreenHeight, 50, 220);
        [self creatColorSelectButton:selectColorView];
        [keyWindow addSubview:selectColorView];

    }
    
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        selectColorView.frame = CGRectMake(5, kScreenHeight - 270, 50, 200);
        
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - 收起线条选择面板
+ (void)hiddenLineView
{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        selectLineWidthView.transform = CGAffineTransformMakeTranslation(0, 270);
        
    } completion:^(BOOL finished) {
        
    }];

}


#pragma mark - 收起颜色选择面板
+ (void)hiddenSelectColorView
{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        selectColorView.frame = CGRectMake(5, kScreenHeight, 50, 220);
        
    } completion:^(BOOL finished) {
        
    }];
}


+ (void)creatColorSelectButton:(UIView *)view
{
    colors = @[[UIColor blackColor],[UIColor whiteColor],[UIColor grayColor],
                     [UIColor redColor],[UIColor greenColor],[UIColor blueColor],
                     [UIColor cyanColor],[UIColor yellowColor],[UIColor magentaColor],
                     [UIColor orangeColor],[UIColor purpleColor],[UIColor brownColor]];

    CGFloat width = CGRectGetWidth(view.frame);
    for (int i = 0; i < colors.count; i++) {
       CGFloat height = 200 / 12;
        UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        colorButton.frame = CGRectMake(0, i * (height + 2), width, height);
        [colorButton setBackgroundColor:colors[i]];
        colorButton.tag = i;
        [colorButton addTarget:self action:@selector(colorButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:colorButton];
        
    }
}



+ (void)colorButtonAction:(UIButton *)button
{
    UIColor *color = colors[button.tag];
    [self hiddenSelectColorView];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SelectColorNotification object:color];
}

+ (void)selectLineWidth:(UISlider *)slider
{
    UILabel *lineLabel = (UILabel *)[selectLineWidthView viewWithTag:11];
    lineLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SelectLineNotification object:@(slider.value)];
}

@end
