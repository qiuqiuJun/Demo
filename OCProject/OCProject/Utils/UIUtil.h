//
//  UIUtil.h
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIUtil : NSObject
+ (UIButton *)btnWithTitle:(NSString *)title bgColor:(UIColor *)bgColor titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selecor:(SEL)selector target:(id)target;
@end
