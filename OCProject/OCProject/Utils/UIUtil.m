//
//  UIUtil.m
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "UIUtil.h"

@implementation UIUtil
+ (UIButton *)btnWithTitle:(NSString *)title bgColor:(UIColor *)bgColor titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selecor:(SEL)selector target:(id)target{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    btn.titleLabel.font = titleFont;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
