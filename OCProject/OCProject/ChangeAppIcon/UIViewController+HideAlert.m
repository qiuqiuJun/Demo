//
//  UIViewController+HideAlert.m
//  StudyDemo
//
//  Created by DOUBLEQ on 2018/9/1.
//  Copyright © 2018年 DOUBLE Q. All rights reserved.
//

#import "UIViewController+HideAlert.h"
#import <objc/runtime.h>
@implementation UIViewController (HideAlert)

+ (void)load{
    Method originalMethod = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
    Method swizzlingMethod = class_getInstanceMethod([self class], @selector(swizzlingPresentViewController:animated:completion:));
    BOOL didAddMethod = class_addMethod([self class], @selector(presentViewController:animated:completion:), method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
    
    if (didAddMethod) {
        class_replaceMethod([self class], @selector(swizzlingPresentViewController:animated:completion:), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzlingMethod);
    }
}
- (void)swizzlingPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alertCon = (UIAlertController *)viewControllerToPresent;
        if (alertCon.title == nil && alertCon.message == nil) {
            UIAlertController *myAlertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"图标已替换" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [myAlertCon addAction:okAction];
            //这里会重新走swizzlingPresentViewController方法，然后alertCon.title ！= nil && alertCon.message ！= nil，然后执行swizzlingPresentViewController方法，其实是走的系统的presentViewController方法，方法结束。
//            [self presentViewController:myAlertCon animated:YES completion:nil];
            
            //如果调用这个方法则直接走的是系统的presentViewController的方法，然后方法结束
            [self swizzlingPresentViewController:myAlertCon animated:YES completion:nil];
            return;
        }
    }
    [self swizzlingPresentViewController:viewControllerToPresent animated:flag completion:completion];
}
@end
