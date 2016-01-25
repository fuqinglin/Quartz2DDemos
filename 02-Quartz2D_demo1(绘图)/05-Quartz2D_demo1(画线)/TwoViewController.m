//
//  TwoViewController.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "TwoViewController.h"
#import "DrawCircleView.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawCircleView *drawView = [[DrawCircleView alloc] initWithFrame:CGRectMake(0, 120, 320, 320)];
    drawView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:drawView];
    
    
}

- (IBAction)dismissView:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
