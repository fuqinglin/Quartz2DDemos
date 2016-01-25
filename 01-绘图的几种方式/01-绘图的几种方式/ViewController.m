//
//  ViewController.m
//  01-绘图的几种方式
//
//  Created by qinglinfu on 16/1/21.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 2);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(ctx, 0, 400);
    CGContextAddLineToPoint(ctx, 320, 400);
    CGContextAddLineToPoint(ctx, 160, 560);
    CGContextAddLineToPoint(ctx, 0, 400);
    CGContextFillPath(ctx);  // 填充
    CGContextStrokePath(ctx); // 描边
}


@end
