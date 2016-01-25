//
//  ViewController.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawLineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    DrawLineView *drawView = [[DrawLineView alloc] initWithFrame:CGRectMake(0, 120, 320, 320)];
    drawView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:drawView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
