//
//  ThreeViewController.m
//  05-Quartz2D_demo1(画线)
//
//  Created by qinglinfu on 15/9/28.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "ThreeViewController.h"
#import "DownLoadView.h"

#import "ColumnarView.h"

@interface ThreeViewController ()
{
    DownLoadView *_loadView;
}

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat x = CGRectGetMidX(self.view.frame) - 75;
    
    _loadView = [[DownLoadView alloc] initWithFrame:CGRectMake(x, 20, 150, 150)];
    _loadView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_loadView];
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    ColumnarView *coluView = [[ColumnarView alloc] initWithFrame:CGRectMake(0, 230, width,300)];
    
    [self.view addSubview:coluView];
    
}

- (IBAction)progressValueChange:(UISlider *)sender {
    
    _loadView.progress = sender.value;
    
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
