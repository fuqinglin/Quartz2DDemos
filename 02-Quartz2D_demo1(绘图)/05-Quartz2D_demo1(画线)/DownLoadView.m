//
//  DownLoadView.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "DownLoadView.h"

@interface DownLoadView ()

@property (nonatomic, strong)UILabel *valueLabel;

@end

@implementation DownLoadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self valueLabel];
    }
    return self;
}

- (UILabel *)valueLabel
{
    if (_valueLabel == nil) {
        
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        _valueLabel.textAlignment = NSTextAlignmentCenter;
        _valueLabel.textColor = [UIColor whiteColor];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.font = [UIFont systemFontOfSize:25];
        _valueLabel.text = @"00.00%";
        
        [self addSubview:_valueLabel];
    }
    
    return _valueLabel;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100];
    
    // 重绘
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawbgView];
    [self drawPragressView];
    
}

// 画背景图
- (void)drawbgView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 150, 150) cornerRadius:20];

    [[UIColor colorWithWhite:0 alpha:0.7] setFill];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFill);
}

// 画进度条
- (void)drawPragressView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(75, 75);
    CGFloat radius = 60;
    CGFloat startAng = -M_PI_2;
    CGFloat endAng = startAng;
    endAng = -M_PI_2 + _progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAng endAngle:endAng clockwise:YES];
//    [path addLineToPoint:center];
//    [path closePath];
    
    CGContextSetLineWidth(context, 5);
//    [[UIColor whiteColor] setFill];
    [[UIColor whiteColor] setStroke];
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetShouldAntialias(context, YES);
    
    CGContextAddPath(context, path.CGPath);
//    CGContextDrawPath(context, kCGPathFill);
    CGContextStrokePath(context);
}






@end
