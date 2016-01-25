//
//  RectLineView.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {

    [self drawLine];
    [self drawLine3];
    [self drawLine2];
    [self drawLine4];
}

// 画直线
- (void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 添加起点
    [path moveToPoint:CGPointMake(0, 10)];
    // 设置线条的目标点
    [path addLineToPoint:CGPointMake(160, 160)];
    [path addLineToPoint:CGPointMake(320, 10)];
//    [path addLineToPoint:CGPointMake(10, 10)];
    [path closePath]; // 关闭路径（起点和终点连接）
    
    // 将路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    // 线条的宽度
    CGContextSetLineWidth(context, 2);
    // 线条的颜色(一)
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    // 线条的颜色(二)
    [[UIColor whiteColor] setStroke];
    
    // 内部的填充颜色
    CGContextSetRGBFillColor(context, 1, 0, 0, 0.8);
    [[UIColor redColor] setFill];
    
    // 阴影
    CGContextSetShadow(context, CGSizeMake(3, 2), 1);
    
    // 设置线条是否平滑
    CGContextSetShouldAntialias(context, YES);
    
    //设置线头的样式（圆角、）
    CGContextSetLineCap(context, kCGLineCapRound);
    
    // 线条连接样式
//    CGContextSetLineJoin(context, kCGLineJoinRound);
    
//    CGContextStrokePath(context);// 描边
//    CGContextFillPath(context); // 填充
    
    CGContextDrawPath(context, kCGPathFillStroke); // 填充和描边
}


// 画曲线
- (void)drawLine2
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 160)];
    CGPoint endPoint1 = CGPointMake(160, 160);
    CGPoint endPoint2 = CGPointMake(320, 160);
    CGPoint controlPoint = CGPointMake(80, 0);
    CGPoint controlPoint2 = CGPointMake(240, 320);
    // 一个控制点
    [path addQuadCurveToPoint:endPoint1 controlPoint:controlPoint];
    [path addQuadCurveToPoint:endPoint2 controlPoint:controlPoint2];
    
    // 两个控制点
//    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint2];
    
    CGContextAddPath(context, path.CGPath);
    CGContextSetLineWidth(context, 2);
    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor redColor] set];
    
    CGContextStrokePath(context);
    
}


//画两条交叉的线
- (void)drawLine3
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 160)];
    [path1 addLineToPoint:CGPointMake(320, 160)];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(160, 0)];
    [path2 addLineToPoint:CGPointMake(160, 320)];
    
    CGContextSetLineWidth(context, 2);
    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor whiteColor] set];
    
    CGContextAddPath(context, path1.CGPath);
    CGContextAddPath(context, path2.CGPath);
    
    CGContextStrokePath(context);
}

// 画圆
- (void)drawLine4
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 160, 160, 160)];
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    CGContextAddPath(context, path.CGPath);
    
    CGContextDrawPath(context, kCGPathStroke);
    
}

@end
