//
//  DrawView.m
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "DrawView.h"
#import "TSBezierPath.h"

@interface DrawView ()

@property (nonatomic, strong)TSBezierPath *path;
@property (nonatomic, strong)NSMutableArray *pathArray;

@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor];
    self.lineWidth = 2;
    self.lineColor = [UIColor redColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawView:context];
    
}

- (void)drawView:(CGContextRef)context
{
    for (TSBezierPath *path in self.pathArray) {
        
        [path.lineColor setStroke];

        CGContextSetLineWidth(context, path.lineWidth);
        CGContextAddPath(context, path.CGPath);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetShouldAntialias(context, YES);
        CGContextDrawPath(context, kCGPathStroke);
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint beganPoint = [touch locationInView:self];
    if (_pathArray == nil) {
        
        self.pathArray = [[NSMutableArray alloc] init];
    }
    
    self.path = [TSBezierPath bezierPath];
    self.path.lineColor = self.lineColor;
    self.path.lineWidth = self.lineWidth;
    [self.path moveToPoint:beganPoint];
    
    [self.pathArray addObject:self.path];

}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    
    [self.path addLineToPoint:endPoint];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


#pragma mark - 撤销
- (void)repealLine
{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

#pragma mark - 清除
- (void)clearLines
{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}


@end
