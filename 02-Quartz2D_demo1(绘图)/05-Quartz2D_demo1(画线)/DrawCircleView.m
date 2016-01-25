//
//  DrawCircleView.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "DrawCircleView.h"

@implementation DrawCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawCircle];
    
    [self drawRandle];
    
    [self drawRadius];
    
    [self drawCaky];
    
}

// 画圆
- (void)drawCircle
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 内切圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 140, 140)];
    CGContextSetLineWidth(context, 2);
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 画圆角矩形
- (void)drawRandle
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(170, 10, 140, 140) cornerRadius:20];
    CGContextSetLineWidth(context, 2);
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

// 画弧形(扇形)
- (void)drawRadius
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint centPoint = CGPointMake(80, 240);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centPoint radius:70 startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    [path addLineToPoint:centPoint];
    [path closePath];
    
    CGContextSetLineWidth(context, 2);
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
}


// 画饼形图
- (void)drawCaky
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint centPoint = CGPointMake(240, 240);
    CGFloat radius = 75;
    CGFloat startAng = 0;
    CGFloat endAng = 0;
    NSArray *values = @[@45,@30,@25];
    NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
    
    for (int i = 0; i<values.count; i++) {
        
        startAng = endAng;
        endAng = startAng + [values[i] floatValue] / 100.0 * M_PI * 2;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centPoint radius:radius startAngle:startAng endAngle:endAng clockwise:YES];
        [path addLineToPoint:centPoint];
        [path closePath];
        [colors[i] setFill];
        [[UIColor whiteColor] setStroke];
        
        CGContextAddPath(context, path.CGPath);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
}

@end
