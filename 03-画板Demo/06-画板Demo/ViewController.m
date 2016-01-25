//
//  ViewController.m
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "SelectView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (strong, nonatomic) UIButton *selectButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectColor:) name:SelectColorNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectLine:) name:SelectLineNotification object:nil];
    
}

- (IBAction)toolButtonAction:(UIButton *)sender {
    
    if (sender.tag == ToolButtonIsColors) {
        sender.selected = !sender.selected;
        self.selectButton = sender;
        if (sender.selected) {
            
            [SelectView showColorSelectView];
            
        } else {
            
            [SelectView hiddenSelectColorView];
        }
    } else if(sender.tag == ToolButtonIsLineSize) {
        sender.selected = !sender.selected;
        self.selectButton = sender;

        if (sender.selected) {
            
            [SelectView showLineView];
            
        } else {
            
            [SelectView hiddenLineView];
        }
        
        
    } else if(sender.tag == ToolButtonIsEraser) {
        
        self.drawView.lineColor = [UIColor whiteColor];
        self.drawView.lineWidth = 30.0;
        [SelectView hiddenSelectColorView];
        [SelectView hiddenLineView];
        self.selectButton.selected = NO;
        
    } else if(sender.tag == ToolButtonIsClear) {
        
        [self.drawView clearLines];
        
    } else if(sender.tag == ToolButtonIsRepeal) {
        
        [self.drawView repealLine];
    }
}


#pragma mark - 监听的通知方法
- (void)selectColor:(NSNotification *)notification
{
    self.selectButton.selected = !self.selectButton.selected;

    UIColor *color = notification.object;
    self.drawView.lineColor = color;
}

- (void)selectLine:(NSNotification *)notification
{
    NSNumber *number = notification.object;
    self.drawView.lineWidth = [number floatValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
