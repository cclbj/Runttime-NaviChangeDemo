//
//  UINavigationBar+Status.h
//  04-状态栏
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Status)

@property (nonatomic,weak)UIView * bgView;

- (void)nav_setBackgroundColor:(UIColor *)backgroundColor;

- (void)nav_clear;

@end
