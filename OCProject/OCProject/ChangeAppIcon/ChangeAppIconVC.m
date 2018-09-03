//
//  ChangeAppIconVC.m
//  StudyDemo
//
//  Created by DOUBLEQ on 2018/9/1.
//  Copyright © 2018年 DOUBLE Q. All rights reserved.
//

#import "ChangeAppIconVC.h"

@interface ChangeAppIconVC ()

@end

@implementation ChangeAppIconVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"换新的icon" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeIocn:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake((CGRectGetWidth(self.view.frame)-200)*0.5, 100, 200, 30);
    btn.tag = 100;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor lightGrayColor];
    [btn2 setTitle:@"换原来的icon" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(changeIocn:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake((CGRectGetWidth(self.view.frame)-200)*0.5, 200, 200, 30);
    btn2.tag = 200;
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:btn2];

}
- (void)changeIocn:(UIButton *)sender{
    if (sender.tag == 100) {
        [self changeAppIconWithName:@"DYICON"];
    }else{
        [self changeAppIconWithName:@""];
    }
}
- (void)changeAppIconWithName:(NSString *)iconName {
    if (@available(iOS 10.3, *)) {
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            return;
        }
        if ([iconName isEqualToString:@""]) {
            iconName = nil;
        }
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    } else {
        UIAlertController *myAlertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"支持10.3以及以上版本" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [myAlertCon addAction:okAction];
        [self presentViewController:myAlertCon animated:YES completion:nil];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
