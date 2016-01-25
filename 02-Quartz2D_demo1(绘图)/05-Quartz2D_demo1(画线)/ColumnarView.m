//
//  ColumnarView.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "ColumnarView.h"

@implementation ColumnarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawCoord];
    [self drawColumnarView];
}

// 画坐标
- (void)drawCoord
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(20,280)];
    [path addLineToPoint:CGPointMake(300, 280)];
    [[UIColor lightGrayColor] setStroke];
    
    CGContextSetLineWidth(context, 2);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
}

// 画进柱形图
- (void)drawColumnarView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *values = @[@50,@70,@20,@45,@10,@80];
    NSArray *colors = @[[UIColor grayColor],[UIColor brownColor],[UIColor yellowColor],
                        [UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
    
    for (int i = 0; i < values.count; i++) {
        
        CGFloat x = 50 + (30 + 10) * i;
        CGFloat height = [values[i] floatValue] / 100.0 * 250;
        CGFloat y = 280 - height;
        
        CGRect rect = CGRectMake(x, y, 30, height);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        [colors[i] setFill];
        
        CGContextAddPath(context, path.CGPath);
        CGContextFillPath(context);
        
    }
    
    
}



@end
