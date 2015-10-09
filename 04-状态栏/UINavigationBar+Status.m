//
//  UINavigationBar+Status.m
//  04-状态栏
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "UINavigationBar+Status.h"
#import <objc/runtime.h>

static char key;

@implementation UINavigationBar (Status)

- (UIView *)bgView
{
    return objc_getAssociatedObject(self, &key);
}

- (void)setBgView:(UIView *)bgView
{
    objc_setAssociatedObject(self, &key, bgView, OBJC_ASSOCIATION_ASSIGN);
}

- (void)nav_setBackgroundColor:(UIColor *)backgroundColor
{
    if (self.bgView == nil)
    {
        UIView * bgView = [[UIView alloc] init];
        
        bgView.frame = CGRectMake(0, -20, self.frame.size.width, 64);
        //    backGorundView.backgroundColor = [UIColor blueColor];
        //添加到navigationBar 最底层
        [self insertSubview:bgView atIndex:0];
        //让navigationBar没有任何颜色
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        //去掉阴影线
        [self setShadowImage:[UIImage new]];
        
        self.bgView = bgView;
    }
    
    self.bgView.backgroundColor = backgroundColor;
    
}

- (void)nav_clear
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.bgView removeFromSuperview];
    self.bgView = nil;

}

@end
