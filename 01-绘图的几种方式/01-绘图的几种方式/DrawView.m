//
//  DrawView.m
//  01-绘图的几种方式
//
//  Created by qinglinfu on 16/1/21.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect
{

    // [self drawTypeOne];
    
    [self drawTypeTwo];
}

// 使用UIBezierPath 绘图
- (void)drawTypeOne
{
    
    // UIBezierPath *path = [UIBezierPath bezierPath];
    // 矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 100, 200, 200)];
    // 圆角矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 100, 200, 200) cornerRadius:20];
    // 弧线
    // UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    // 内切圆\椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 200, 200)];
    
    //CGPoint p1 = CGPointMake(100, 100);
    //CGPoint p2 = CGPointMake(200, 300);
    //[path moveToPoint:p1];
    //[path addLineToPoint:p2];
    //[path addQuadCurveToPoint:p1 controlPoint:p2];
    //[path addArcWithCenter:p1 radius:50 startAngle:M_PI_4 endAngle:M_PI_2 clockwise:YES];
    //[path closePath];
    // path removeAllPoints];
    [[UIColor redColor] setFill]; // 设置填充颜色
    [[UIColor whiteColor] setStroke]; // 设置描边颜色
    path.lineWidth = 5; // 线宽
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinMiter;
    path.miterLimit = 20;
    [path fill];    // 填充
    [path stroke]; // 描边
}

//Core Graphics 绘图
- (void)drawTypeTwo
{
    // 1、获取当前绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2、设置上下文属性
    // > 线条宽度
    CGContextSetLineWidth(ctx, 5);
    
    // > 填充颜色
        //方式一
    // CGFloat color[4] = {1,1,0,1};
    // CGContextSetFillColor(ctx, color);
        //方式二
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
        //方式三
    //CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
    
    // > 设置线条颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    // > 设置抗锯齿
    CGContextSetShouldAntialias(ctx, YES);
    
    
    // 2、绘制图形
    
    // > 三角形
    CGContextSaveGState(ctx); // 保存上下文状态
    CGContextSetLineWidth(ctx, 2);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextMoveToPoint(ctx, 0, 400);
    CGContextAddLineToPoint(ctx, 320, 400);
    CGContextAddLineToPoint(ctx, 160, 560);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);  // 填充
    CGContextStrokePath(ctx); // 描边
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    // CGContextDrawPath(ctx, kCGPathFillStroke); // 填充并描边
    CGContextRestoreGState(ctx); // 恢复上下文状态
    
    // > 五角星
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 100, 250);
    CGContextAddLineToPoint(ctx, 150, 150);
    CGContextAddLineToPoint(ctx, 200, 250);
    CGContextAddLineToPoint(ctx, 80, 190);
    CGContextAddLineToPoint(ctx, 220, 190);
    CGContextAddLineToPoint(ctx, 100, 250);
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextRestoreGState(ctx);
    
    
    // > 矩形
    CGContextSaveGState(ctx);
    CGContextSetShadow(ctx, CGSizeMake(5, 2), 10);
    CGContextAddRect(ctx, CGRectMake(10, 20, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextRestoreGState(ctx);
    
    // > 内切圆形、椭圆
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectMake(120, 20, 100, 100));
    CGContextStrokePath(ctx);  // 填充
    CGContextRestoreGState(ctx);

    // > 贝塞尔曲线
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 0, 300);
    // 一个控制点
    // CGContextAddQuadCurveToPoint(ctx, 80, 100, 160, 300);
    // CGContextAddQuadCurveToPoint(ctx, 240, 500, 320, 300);
    // 两个控制点
    CGContextAddCurveToPoint(ctx, 80, 100, 240, 500, 320, 300);
    CGContextDrawPath(ctx, kCGPathStroke);
    CGContextRestoreGState(ctx);
    
    // > 弧线
    CGContextAddArc(ctx, 240, 200, 80, 0, M_PI_2, NO);
    CGContextStrokePath(ctx);
    
    // > 虚线
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 240, 20);
    CGContextAddLineToPoint(ctx, 240, 200);
    CGContextSetLineWidth(ctx, 2);
    CGFloat lenths[] = {5.0,10.0,5.0};
    CGContextSetLineDash(ctx, 0, lenths, 3); // 设置虚线
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 260, 20);
    CGContextSetLineWidth(ctx, 2);
    CGFloat lenths_[] = {10,5};
    CGContextSetLineDash(ctx, 0, lenths_, 2);
    //CGContextSetLineDash(ctx, 5, lenths_, 2);
    CGContextAddLineToPoint(ctx, 260, 200);
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);

    // > 裁剪
    //CGContextClipToRect(ctx, CGRectMake(50, 50, 50, 50));
    //CGContextClip(ctx);
    //CGContextFillPath(ctx);
    
    
}



@end
