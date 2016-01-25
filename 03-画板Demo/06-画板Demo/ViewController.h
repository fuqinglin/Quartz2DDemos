//
//  ViewController.h
//  06-画板Demo
//
//  Created by qinglinfu on 15/9/29.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ToolButtonIsColors = 0,
    ToolButtonIsLineSize,
    ToolButtonIsEraser,
    ToolButtonIsClear,
    ToolButtonIsRepeal
} ToolButtonType;


@interface ViewController : UIViewController


@end

